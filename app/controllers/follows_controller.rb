class FollowsController < ApplicationController

    def article_follow_toggle
        @article = Article.find(params[:id])
        if @article.followed_by?(current_user)
            current_user.stop_following(@article)

        else !@article.followed_by?(current_user)
            current_user.follow(@article)
        end 
            # redirect_to article_path(@article.id)
    end 

    def zizum_front_follow_toggle

        @zizum = Zizuminfo.find(params[:id])
        if @zizum.followed_by?(current_user)
            current_user.stop_following(@zizum)

        else !@zizum.followed_by?(current_user)
            current_user.follow(@zizum)
        end 
            # redirect_to zizum_path(@zizum.id)
    end

    def zizum_back_follow_toggle

        @zizum = Zizuminfo.find(params[:id])
        if @zizum.followed_by?(current_user)
            current_user.stop_following(@zizum)

        else !@zizum.followed_by?(current_user)
            current_user.follow(@zizum)
        end 
            redirect_to profile_path(current_user.id) 
    end
end 
