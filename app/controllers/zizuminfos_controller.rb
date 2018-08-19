class ZizuminfosController < ApplicationController
  before_action :set_zizuminfo, only: [:show, :edit, :update, :destroy]

  # GET /zizuminfos
  # GET /zizuminfos.json
  def index
    @zizuminfos = Zizuminfo.all
  end

  # GET /zizuminfos/1
  # GET /zizuminfos/1.json
  def show
  end

  # GET /zizuminfos/new
  def new
    @zizuminfo = Zizuminfo.new
  end

  # GET /zizuminfos/1/edit
  def edit
  end

  # POST /zizuminfos
  # POST /zizuminfos.json
  def create
    @zizuminfo = Zizuminfo.new(zizuminfo_params)

    respond_to do |format|
      if @zizuminfo.save
        format.html { redirect_to @zizuminfo, notice: 'Zizuminfo was successfully created.' }
        format.json { render :show, status: :created, location: @zizuminfo }
      else
        format.html { render :new }
        format.json { render json: @zizuminfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zizuminfos/1
  # PATCH/PUT /zizuminfos/1.json
  def update
    respond_to do |format|
      if @zizuminfo.update(zizuminfo_params)
        format.html { redirect_to @zizuminfo, notice: 'Zizuminfo was successfully updated.' }
        format.json { render :show, status: :ok, location: @zizuminfo }
      else
        format.html { render :edit }
        format.json { render json: @zizuminfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zizuminfos/1
  # DELETE /zizuminfos/1.json
  def destroy
    @zizuminfo.destroy
    respond_to do |format|
      format.html { redirect_to zizuminfos_url, notice: 'Zizuminfo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zizuminfo
      @zizuminfo = Zizuminfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zizuminfo_params
      params.require(:zizuminfo).permit(:zizum_name, :sido, :sigungu, :doromyeong, :gunmul_bunho, :sangse_juso, :phone_number, :image, :restaurant)
    end
end
