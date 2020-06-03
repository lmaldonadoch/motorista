class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :get_articles, only: [:index, :articles_by_category]

  # GET /articles
  # GET /articles.json

  attr_accessor :bikes_articles, :off_road_articles, :race_articles, :cars_articles

  def index
    
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
    @article.authorid = session[:current_user_id]

    respond_to do |format|
      if @article.save
        article_params[:article_categories].select!{|category| category != ''}.each do |category|
          ArticleCategory.create(articleid: @article.id, category_id: Category.find_by(name: category).id)
        end
        format.html { redirect_to @article}
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

  def articles_by_category
    render 'articles_by_category', category: params[:category]
  end

  def vote
    @article = Article.find(params[:article_id])
    p @article.votes.map { |n| return true if n.userid == session[:current_user_id] }
    if !@article.votes.empty? && @article.votes.any? { |n| n.userid == session[:current_user_id] }
      redirect_to article_path(@article), alert: 'You have already voted for this article'
    else
      Vote.create(articleid: @article.id, userid: session[:current_user_id])
      redirect_back(fallback_location: root_path)
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :text, :image, :authorid, :categories, article_categories: [])
    end

    def get_articles
      @articles = Article.all.includes(:votes, :categories).order(:created_at)
      @featured_article = @articles[0]
      @cars_articles = []
      @bikes_articles = []
      @off_road_articles = []
      @race_articles = []
      @articles.each do |article|
        @featured_article = article if article.number_of_votes > @featured_article.number_of_votes
        @bikes_articles << article if article.categories.any? {|category| category.name == 'Bikes'}
        @off_road_articles << article if article.categories.any? {|category| category.name == 'Off Road'}
        @race_articles << article if article.categories.any? {|category| category.name == 'Racing'}
        @cars_articles << article if article.categories.any? {|category| category.name == 'Cars'}
      end
      category_priority = Category.all.order(:priority).select(:name).distinct
      @articles_by_category = []
      category_priority.each do |n|
        if n.name == 'Cars'
          @articles_by_category << 'Cars'
          @articles_by_category << @cars_articles
        elsif n.name == 'Bikes'
          @articles_by_category << 'Motorcycles'
          @articles_by_category << @bikes_articles
        elsif n.name == 'Off Road'
          @articles_by_category << 'Off Road'
          @articles_by_category << @off_road_articles
        else
          @articles_by_category << 'Racing'
          @articles_by_category << @race_articles
        end
      end
    end
end
