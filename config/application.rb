require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BioRitmoScheduling
  class Application < Rails::Application
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :pt

    config.generators do |g|
      g.test_framework      :rspec, fixtures: true, view_specs: false, request_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
      g.integration_tool    :rspec, fixture: true, views: true
    end
  end

end
