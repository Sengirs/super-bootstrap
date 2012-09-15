class UserMailer < ActionMailer::Base
  default from: "no-reply@my-app.com"
  
  def welcome(user)
    @user = user
    mail to: @user.email, subject: 'Welcome'
  end
end
