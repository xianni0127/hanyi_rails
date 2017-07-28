class AutoSendemailJob < ApplicationJob

  queue_as :auto_sendemail

  def perform(email)
    # Do something later
    # ChildrenMailer.welcome_email(@child).deliver_now

    ChildrenMailer.auto_send(email).deliver_now
    puts "I am now in perform function"
  end
end
