class HomeController < ApplicationController
    def index
        @article = Article.first #クラスの一番最初のデータを取得する
    end

    def about

    end
end