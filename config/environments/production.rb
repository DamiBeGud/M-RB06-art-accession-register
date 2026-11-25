Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false
  config.force_ssl = false # This API's declared deployment surface is internal HTTP.
  config.secret_key_base = ENV.fetch("SECRET_KEY_BASE")
  config.active_record.dump_schema_after_migration = false
  config.log_level = :warn
end
