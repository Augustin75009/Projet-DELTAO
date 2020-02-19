class UserMailer < ApplicationMailer
  default from: "De la terre à l'objet <contact@delaterrealobjet.fr>"
  def ceramic_ready(user)
    @user = user
    mail(to: user.email, subject: "Vos créations sont prêtes")
  end

  def gift_card(gift)
    @gift = gift
    mail(to: gift.user.contact_email, subject: "Bon cadeau")
  end
end
