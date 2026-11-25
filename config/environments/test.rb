Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = false
  config.consider_all_requests_local = false
  config.secret_key_base = "illustrative-unit-test-only-not-a-runtime-secret"
  config.log_level = :fatal
end
