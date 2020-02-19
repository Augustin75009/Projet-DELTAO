class UserMailer < ApplicationMailer
  default from: "De la terre à l'objet <contact@delaterrealobjet.fr>"
  def ceramic_ready(user)
    @user = user
    mail(to: user.email, subject: "Vos créations sont prêtes")
  end
end
