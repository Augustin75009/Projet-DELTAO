Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_eXZQ1EbsRFDUjTuqY9iA8FQr'],
  secret_key:      ENV['sk_test_pElkWN7bEeGNDHYXZdeAX8qV']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
