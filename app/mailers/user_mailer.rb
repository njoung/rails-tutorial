class UserMailer < ActionMailer::Base
  default from: "noreply@example.com"

  def account_activation(user)
    @user = user
    puts "sent email to #{user.email}"
    mail to: user.email, subject: "Account activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end