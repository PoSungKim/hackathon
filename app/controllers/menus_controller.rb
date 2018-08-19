class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json

  #메뉴로 검색
  def search
  end

  def index
     #초기값 설정. 테러 미안.ㅠㅠ 이렇게 안하니까 에러나서.
     a1=0
     a2=0
     a3=0 
     a4=0
     a5=0
     a6=0
     a7=0
     a8=0
     a9=0
     a10=0
     a11=0
     a12=0
     a13=0
     a14=0
     a15=0
     a16=0
     a17=0
     a18=0
     a19=0
     a20=0
     a21=0
 
     # ----------------search 시에 체크-----------------------
     a1 = 2 if params[:a1_maemil] != "true" # 체크 안했을 경우-알러지 없다. / check 하면 true(알러지없다). a1, a2 등은 알러지 없다고 표시 되면 1 
     a2 = 2 if params[:a2_mil] != "true"
     a3 = 2 if params[:a3_daedu] != "true"
     a4 = 2 if params[:a4_hodu] != "true"
     a5 = 2 if params[:a5_ddangkong] != "true"
     a6 = 2 if params[:a6_peach] != "true"
     a7 = 2 if params[:a7_tomato] != "true"
     a8 = 2 if params[:a8_piggogi] != "true"
     a9 = 2 if params[:a9_nanryu] != "true" 
     a10 = 2 if params[:a10_milk] != "true"
     a11 = 2 if params[:a11_ddakgogi] != "true"
     a12 = 2 if params[:a12_shoigogi] != "true"
     a13 = 2 if params[:a13_saewoo] != "true"
     a14 = 2 if params[:a14_godeungeoh] != "true"
     a15 = 2 if params[:a15_honghap] != "true"
     a16 = 2 if params[:a16_junbok] != "true"
     a17 = 2 if params[:a17_gul] != "true"
     a18 = 2 if params[:a18_jogaeryu] != "true"
     a19 = 2 if params[:a19_gye] != "true"
     a20 = 2 if params[:a20_ohjingeoh] != "true"
     a21 = 2 if params[:a21_ahwangsan] != "true"
 
     #---------------------------------------------------------
 
 
     #!!만약 교차가능성이랑 모르겠음 부분 처리하려면 수정해야함.---------
 
     #--------------------search 에 맞게 메뉴 찾기---------------------(이 밑에꺼도 줄 정리하려니까 오류났다.ㅠㅠ 테러 죄송)
 
     @menus = Menu.where("#{:a1_maemil} <= ? AND #{:a2_mil} <= ? AND #{:a3_daedu} <= ? AND #{:a4_hodu} <= ? AND #{:a5_ddangkong} <= ? AND #{:a6_peach} <= ? AND #{:a7_tomato} <= ? AND #{:a8_piggogi} <= ? AND #{:a9_nanryu} <= ? AND #{:a10_milk} <= ? AND #{:a11_ddakgogi} <= ? AND #{:a12_shoigogi} <= ? AND #{:a13_saewoo} <= ? AND #{:a14_godeungeoh} <= ? AND #{:a15_honghap} <= ? AND #{:a16_junbok} <= ? AND #{:a17_gul} <= ? AND #{:a18_jogaeryu} <= ? AND #{:a19_gye} <= ? AND #{:a20_ohjingeoh} <= ? AND #{:a21_ahwangsan} <= ?", a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21)
     
     # -------------------메뉴(@menus)가 속한 식당 찾기.----------------
     puts "==============실험시작================="
     puts Menu.restaurants
     puts "==============실험끝================="
     #@restaurants = @menus.restaurants
     #@restaurants = Restaurant.find(@menus.map(&:restaurant_id).uniq)
 
     ### @menus.where(:shop_id => 어쩌고 ) 이용하기 (views 에서 보일 때)


      
  end

  def getMenu
    #받아오기
       @restaurant_name = params[:res_name]
       @menus = params[:res_menu]
       $result = {"restaurant_name" => 0, "menus" => nil}

       $result[:restaurant_name] = @restaurant_name
       $result[:menus] = @menus
       $result = $result.to_json
      #  puts "실험실험실험============================================="
      #  puts $result
      #  puts "싫끝====================================================="

       respond_to do |format|
        format.json {render json: $result}
      end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        ###################레스토랑, 메뉴 연동###################################3
        @match = Menumatch.new
        @match.menu_id = @menu.id
        @match.menu_name = @menu.menu_name

        #식당 이름이 restaurant에 없는 경우 제어, 레스토랑 이름에서 앞뒤 띄어쓰기 없애기
        @r_match = Restaurant.where(restaurant_name: @menu.restaurant_name)[0]

        if !@r_match.nil?
          @match.restaurant_id = @r_match.id
          @match.restaurant_name = @menu.restaurant_name
          puts "matching sucess!"
        else      
          puts "restaurant name should be made"
        end
        byebug
        @match.save
        ##############################연동끝####################################



        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update    
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    Menumatch.where(menu: @menu.id)[0].destroy

    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:menu_name,:a1_maemil,:a2_mil,:a3_daedu,:a4_hodu,:a5_ddangkong,:a6_peach,:a7_tomato,:a8_piggogi, :a9_nanryu, :a10_milk, :a11_ddakgogi, :a12_shoigogi, :a13_saewoo, :a14_godeungeoh, :a15_honghap, :a16_junbok, :a17_gul, :a18_jogaeryu, :a19_gye, :a20_ohjingeoh, :a21_ahwangsan, :restaurant_name, :image)
    end
end