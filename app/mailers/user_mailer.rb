class UserMailer < ApplicationMailer
  default from: "De la terre à l'objet <contact@delaterrealobjet.fr>"
  def ceramic_ready(user)
    @user = user
    mail(to: user.email, subject: "Vos créations sont prêtes")
  end

  def ceramic_ready_one(email)
    mail(to: email, subject: "Rappel : Vos créations sont prêtes")
  end

  def gift_card(gift)
    @gift = gift
    mail(to: gift.user.contact_email, subject: "Bon cadeau")
  end

  def purchase_from_gift(purchase)
    @purchase = purchase
    mail(to: purchase.user.contact_email, subject: "Votre atelier de céramique")
  end
end
