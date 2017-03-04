require_relative 'boot'
require 'csv'
#require 'iconv'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module C3Suite
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec,
        :fixtures => true,
        :view_specs => false,
        :helper_specs => false,
        :routing_specs => false,
        :controller_specs => true,
        :request_specs => true
        g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    config.assets.precompile += Ckeditor.assets
    config.assets.precompile += %w( ckeditor/* )
    config.assets.precompile += ['jquery.countdown.js', 'jquery.countdown.css','jquery.plugin.js']
    
    config.active_job.queue_adapter = :delayed_job
  end


end
