class RealtionshipMailer < ApplicationMailer
  def new_follower(user, follower)
    @user = user
    @follower = follower
    mail to: user.email, subject: '【お知らせ】フォローされました'

  end

  def welcome
  end
end


RealtionshipMailer.new_follower(User.first)