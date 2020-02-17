class UserMailer < ApplicationMailer
  default from: "Woonies <hello@woonies.com>"
  def ceramic_ready(user)
    mail(to: user.email, subject: "Bienvenue chez Woonies")
  end
end
