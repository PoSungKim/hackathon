class FollowsController < ApplicationController

    def article_follow_toggle
        @article = Article.find(params[:id])
        if @article.followed_by?(current_user)
            current_user.stop_following(@article)

        else !@article.followed_by?(current_user)
            current_user.follow(@article)
        end 
            redirect_to article_path(@article.id)
    end 

    def zizum_front_follow_toggle

        @zizum = Zizuminfo.find(params[:id])
        if @zizum.followed_by?(current_user)
            current_user.stop_following(@zizum)

        else !@zizum.followed_by?(current_user)
            current_user.follow(@zizum)
        end 
            redirect_to menus_path(id: @zizum.id, utf8: params[:utf8], sido: params[:sido] , sigungu: params[:sigungu], a9_nanryu: params[:a9_nanryu], a6_peach: params[:a6_peach], a7_tomato: params[:a7_tomato], a1_maemil: params[:a1_maemil], a2_mil: params[:a2_mil], a3_daedu: params[:a3_daedu], a11_ddakgogi: params[:a11_ddakgogi], a12_shoigogi: params[:a12_shoigogi], a8_piggogi: params[:a8_piggogi], a13_saewoo: params[:a13_saewoo], a14_godeungeoh: params[:a14_godeungeoh], a15_honghap: params[:a15_honghap], a16_junbok: params[:a16_junbok], a17_gul: params[:a17_gul], a18_jogaeryu: params[:a18_jogaeryu], a19_gye: params[:a19_gye], a20_ohjingeoh: params[:a20_ohjingeoh], a4_hodu: params[:a4_hodu], a5_ddangkong: params[:a5_ddangkong], a21_ahwangsan: params[:a21_ahwangsan], commit: params[:commit])
    end

    def zizum_back_follow_toggle

        @zizum = Zizuminfo.find(params[:id])
        if @zizum.followed_by?(current_user)
            current_user.stop_following(@zizum)

        else !@zizum.followed_by?(current_user)
            current_user.follow(@zizum)
        end 
            redirect_to zizuminfo_path(@zizum.id) 
    end
end 
