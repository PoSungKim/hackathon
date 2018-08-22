class UserrequestsController < ApplicationController  
  def index
    @userrequest_ = Userrequest.all
  end

  def new_request
    @r_id = params[:retaurantID]
    @userrequest = Userrequest.new
  end

  def edit_request
    @m_id = params[:menuID]
    @original_info = Menu.find(@m_id)
  
    @userrequest = Userrequest.new(menu_name: @original_info.menu_name, restaurant_id: @original_info.restaurant_id, restaurant_name: @original_info.restaurant_name, a1_maemil: @original_info.a1_maemil, a2_mil: @original_info.a2_mil,a3_daedu: @original_info.a3_daedu,a4_hodu: @original_info.a4_hodu, a5_ddangkong: @original_info.a5_ddangkong, a6_peach: @original_info.a6_peach, a7_tomato: @original_info.a7_tomato, a8_piggogi: @original_info.a8_piggogi, a9_nanryu: @original_info.a9_nanryu, a10_milk: @original_info.a10_milk, a11_ddakgogi: @original_info.a11_ddakgogi, a12_shoigogi: @original_info.a12_shoigogi, a13_saewoo: @original_info.a13_saewoo, a14_godeungeoh: @original_info.a14_godeungeoh, a15_honghap: @original_info.a15_honghap, a16_junbok: @original_info.a16_junbok, a17_gul: @original_info.a17_gul, a18_jogaeryu: @original_info.a18_jogaeryu, a19_gye: @original_info.a19_gye, a20_ohjingeoh: @original_info.a20_ohjingeoh, a21_ahwangsan: @original_info.a21_ahwangsan, image: @original_info.image)

    redirect_to :back
  end

  def create
    @userrequest = Userrequest.new(userrequest_params)
    @userrequest.save

    redirect_to :back
  end

  def permit
  end

  
  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def userrequest_params
    params.require(:userrequest).permit(:request_type, :user_id, :menu_name, :restaurant_id, :restaurant_name, :a1_maemil,:a2_mil,:a3_daedu,:a4_hodu,:a5_ddangkong,:a6_peach,:a7_tomato,:a8_piggogi, :a9_nanryu, :a10_milk, :a11_ddakgogi, :a12_shoigogi, :a13_saewoo, :a14_godeungeoh, :a15_honghap, :a16_junbok, :a17_gul, :a18_jogaeryu, :a19_gye, :a20_ohjingeoh, :a21_ahwangsan, :image)
  end
end