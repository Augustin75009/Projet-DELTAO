class UserMailer < ApplicationMailer
  # using SendGrid's Ruby Library
  # https://github.com/sendgrid/sendgrid-ruby
  require 'sendgrid-ruby'
  include SendGrid

  def ceramic_ready(user)
    @user = user
    mail = Mail.new
    mail.from = Email.new(email: "De la terre à l'objet <contact@delaterrealobjet.fr>")
    personalization = Personalization.new
    personalization.add_to(Email.new(email: user.email))
    personalization.add_dynamic_template_data({
      "subject" => "Rappel : Vos créations sont prêtes"
    })
    mail.add_personalization(personalization)
    mail.template_id = 'd-091f0f433a304145900fc17d3ac74b10'

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end

  def ceramic_ready_one(email)
    mail = Mail.new
    mail.from = Email.new(email: "De la terre à l'objet <contact@delaterrealobjet.fr>")
    personalization = Personalization.new
    personalization.add_to(Email.new(email: email))
    personalization.add_dynamic_template_data({
      "subject" => "Rappel : Vos créations sont prêtes"
    })
    mail.add_personalization(personalization)
    mail.template_id = 'd-091f0f433a304145900fc17d3ac74b10'

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end

  def gift_card(gift)
    @gift = gift
    mail = Mail.new
    mail.from = Email.new(email: "De la terre à l'objet <contact@delaterrealobjet.fr>")
    personalization = Personalization.new
    personalization.add_to(Email.new(email: gift.user.contact_email))
    personalization.add_dynamic_template_data({
      "subject" => "Bon cadeau",
      "gift_for" => gift.gift_to,
      "gift_type" => gift.product_sku,
      "gift_from" => gift.gift_from,
      "created_at" => @gift.created_at.to_date.to_formatted_s(:number),
      "gift_id" => @gift.id

    })
    mail.add_personalization(personalization)
    mail.template_id = 'd-12c0e4660090406c957eab4093864603'

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end
end
