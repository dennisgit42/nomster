class NotificationMailer < ApplicationMailer
  default from: "no-reply@nomsterapp.com"

  def comment_added
    mail(to: "den2net@yahoo.com",
          subject: "A comment has been added to place you created.")
  end

end
