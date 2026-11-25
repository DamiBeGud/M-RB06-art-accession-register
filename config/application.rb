require_relative "boot"
require "rails"
require "active_record/railtie"
require "action_controller/railtie"
Bundler.require(*Rails.groups)
module ArtAccessionRegister
  class Application < Rails::Application
    config.load_defaults 8.1
    config.api_only=true
    config.action_controller.wrap_parameters_by_default=false
    config.eager_load=ENV['RAILS_ENV']=='production'
    config.autoload_paths << root.join('app/domain')
    config.logger=ActiveSupport::Logger.new($stdout)
    config.filter_parameters+=[:password, :secret]
  end
end
