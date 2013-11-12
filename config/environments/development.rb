AltruistDeveloper::Application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { :host => 'localhost:3000'}
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true

  ENV['GITHUB_APP_ID'] = 'bf0551f2235a6aa78764'
  ENV['GITHUB_APP_SECRET'] = '8160e6c4d469f0ebd7fbd9d82dd25c3886de65c1'
end
