
secret = Rails.env.production? ? ENV['SECRET_KEY_BASE'] : 'a25a723443b5e27040d8f182153295518fb4dad8c52238bd3ce90be3aff36a7e0c399b456e0b57a4d0439e0fd2c068f987be8a1ad7c582437c044f5af2fcb9ad'

BioRitmoScheduling::Application.config.secret_key_base = secret
