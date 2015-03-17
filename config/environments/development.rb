Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false
  config.after_initialize do
    ActiveMerchant::Billing::Base.mode = :test
    paypal_options = {
      :login => "arvindyuvasoft112-facilitator_api1.gmail.com",
      :password => "1381412536",
      :signature => "ABAXPA6E4bx7kbvfR8FDomA.2M5UAw9Go1aCM--SvoBUePOuS8x0sLbZ"
    }
    ::STANDARD_GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(paypal_options)
    ::EXPRESS_GATEWAY = ActiveMerchant::Billing::PaypalExpressGateway.new(paypal_options)
  end

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  # config.action_mailer.raise_delivery_errors = false
  # config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true
  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  #mailer
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { :host => 'http://artistmagnet.herokuapp.com' }  
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "gmail.com",
    authentication: "plain",
    enable_starttls_auto: true,
    :user_name => 'yuvasoftest@gmail.com',
    :password => 'yuva123456789'
  }

end
