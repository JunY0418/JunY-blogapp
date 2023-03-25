class ArticlesController < ApplicationController
    # 自動読み込みを有効にするための行
    require_dependency 'article'
    def index
      @article = Article.first
    end

end