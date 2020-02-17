class UserMailer < ApplicationMailer
  default from: "De la terre à l'objet <contact@delaterrealobjet.fr>"
  def ceramic_ready(email)
    mail(to: email, subject: "Vos créations sont prêtes")
  end
end
