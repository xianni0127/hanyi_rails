class ChildrenMailer < ApplicationMailer
  default from: 'exmple@gmail.com'

  def welcome_email(child)
    @child = child
    @url = 'http://www.gmail.com'
    mail(to: @child.email, subject:"Weclome to My Awesome Site")
  end
end

class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email,
         subject: 'Welcome to My Awesome Site',
         template_path: 'notifications',
         template_name: 'another')
  end

  def receive(email)
    page= Page.find_by(address:email.to.first)
    page.emails.create(
    subject:email.subject,
    body:emial.body
    )

    if email.has_attachments?
      email.attachments.create({
        file:attachment,
        description:email.subject
        })
    end
  end
end


class AdminMailer < ApplicationMailer
  default to: Proc.new {Admin.plunk(:email)},
            from: 'xianni0127@sina.com'
  def new_registration(user)
    @user =user
    mail(suject:"New User Signup:#{@user.email}")
  end
end
