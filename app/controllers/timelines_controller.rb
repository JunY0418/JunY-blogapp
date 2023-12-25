class TimelinesController < ApplicationController
  before_action :authenticate_user!
  def show
    user_ids = current_user.followings.pluck(:id) #pluckについて（https://techracho.bpsinc.jp/hachi8833/2018_09_26/62333）
    @articles = Article.where(user_id: user_ids)
  end
end