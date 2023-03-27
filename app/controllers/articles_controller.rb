class ArticlesController < ApplicationController
    # 自動読み込みを有効にするための行
    require_dependency 'article'
    def index
      @articles = Article.all
    end
    def show
      @article = Article.find(params[:id])
    end
    def new
      @article = Article.new
    end
end