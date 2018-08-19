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

    def retuarant_follow_toggle
        
    end 

    def menu_follow_toggle
        
    end
end
