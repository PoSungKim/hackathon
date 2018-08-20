class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  require 'open-uri'
  require 'json'
  
  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
    # @rt_name = params[:rt_name]
    # @rt_num = params[:rt_num]
    # @restaurants = Restaurant.where("#{:restaurant_name} LIKE ?", params[:restaurant_name])
     
    url ="http://apis.data.go.kr/B552015/NpsBplcInfoInqireService/getBassInfoSearch?ldong_addr_mgpl_dg_cd=41&ldong_addr_mgpl_sggu_cd=117&ldong_addr_mgpl_sggu_emd_cd=101&wkpl_nm=#{@rt_name}&bzowr_rgst_no=#{@rt_num}&pageNo=10&startPage=10&numOfRows=1&pageSize=1&serviceKey=IoGcqdatXH1xSmopMvIleCtd7ZJELW2kJg9d2WvfZdbxvH1stcbh8Gvdui/iNUG28Wcq/uppkV0YZqU4Bd3BOA==&&_type=json"
    isBrand= JSON.load(open(url))
    puts isBrand

    # @name= isBrand["response"]["body"]["items"]["item"]["wkplJnngStcd"]

    # if isBrand["response"]["body"]["items"]["item"]["wkplJnngStcd"] != nil
    @result= if params[:rt_num] && isBrand["response"]["body"]["items"]["item"]["wkplJnngStcd"] ==1
      "운영중"
    elsif  params[:rt_num] && isBrand["response"]["body"]["items"]["item"]["wkplJnngStcd"] == 2
      "탈퇴"
    else
    end  
    # end

  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params[:board][:user_id] = current_user.id
      params.require(:board).permit(:title, :content, :user_id,:notice)
    end
end
