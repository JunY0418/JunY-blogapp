class ArticlesController < ApplicationController
    # 自動読み込みを有効にするための行
    # require_dependency 'article'

    # require 'article'
    
    def index
      @articles = Article.all
    end

    def show
      @article = Article.find(params[:id])
    end

    def new
      @article = Article.new
    end
    
    # データの枠を作り、もしデータを保存できたらそのページに飛ぶ、できなかったら
    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to article_path(@article), notice: '保存されています'
      else
        flash.now[:error] = '保存に失敗しました'
        render :new, status: :unprocessable_entity

      end
    end

    def edit
      @article = Article.find (params[:id])
    end

    # フォームからの投稿データからタイトルと内容を抜き出す操作
    private
    def article_params
      params.require(:article).permit(:title, :content)
    end
end