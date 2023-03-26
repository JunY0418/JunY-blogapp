class ArticlesController < ApplicationController
    # def index
    #   @articles = Article.all
    # end
    # def show
    #   Article.show(params[:id])
    # end
    def index
      @articles = Article.all
    end
  
    def show
      @article = Article.find(params[:id])
    end

end