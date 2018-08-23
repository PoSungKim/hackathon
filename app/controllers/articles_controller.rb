class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user = current_user

    ## for notification 나중에 주석해제
    #@users = User.all 
  
    #@users.each do |user|
    #  @new_alarm = NewAlarm.create! user: user , #알림가는 사용자  #원래는 commentcreate에서 user: commentable user== post작성자
    #    content: "식당에 #{@article.title.truncate(15, omission: '...')}가 추가되었습니다.", # 워딩수정하기
    #    link: request.referrer 수정하기
    #end 
  
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update

  ## for notification
  @article.followers.each do |follower|
    @new_alarm = NewAlarm.create! user: follower , #좋아요한 사용자
    content: " #{@article.title.truncate(15, omission: '...')}의 메뉴가 업데이트되었습니다.", # 워딩 수정하기
    link: request.referrer #수정하기 해당 article path로
  end

    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :articleimage, :user_id,:notice)
    end
end
