class ChildrenMailer < ApplicationMailer
  default from: 'xiannii0127@sina.com'

  def weclome_email(user)
    @user = user
    @url = 'http://sina.com/login'
    mail(to: @user.email, subject:"Weclome to My Awesome Site")
  end
end
