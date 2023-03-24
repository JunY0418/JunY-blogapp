class HomeController < ApplicationController
    # 自動読み込みを有効にするための行
    require_dependency 'article'
    def index
      @article = Article.first
    end

    def about

    end
end