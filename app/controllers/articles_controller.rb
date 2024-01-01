class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show 
  end

  def new
    @article = current_user.articles.build
  end

  # データの枠を作り、もしデータを保存できたらそのページに飛ぶ、できなかったら
  def create
    # @article = current_user.articles.build(article_params)
    # @article.eyecatch.attach(params[:article][:eyecatch]) # Active Storageの添付ファイルを追加
  
    # if @article.save
    #   # service_nameカラムに値を設定する
    #   @article.eyecatch.blob.update(service_name: ActiveStorage::Blob.service.name)
  
    #   redirect_to article_path(@article.id), notice: '保存されています'
    # else
    #   flash.now[:error] = '保存に失敗しました'
    #   render :new, status: :unprocessable_entity
    # end
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article.id), notice: '保存されています'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    article = current_user.articles.find(params[:id])
    article.destroy!
    redirect_to root_path, notice: '削除に成功しました', status: :see_other
  end

  # フォームからの投稿データからタイトルと内容を抜き出す

  private
  def article_params
    params.require(:article).permit(:title, :content, :eyecatch)
  end

  def set_article
    puts "params[:id]: #{params[:id]}"
    @article = Article.find(params[:id])
    puts "@article: #{@board.inspect}"
  end
end