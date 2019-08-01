Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker


  # Automatic reload web page while develop
  # https://github.com/onesupercoder/rack-livereload
  # Add Rack::LiveReload to the bottom of the middleware stack with the default options:
  config.middleware.insert_after ActionDispatch::Static, Rack::LiveReload



  # This fixes a not shown web console in `docker logs` or `docker-compose`
  # First we check if this rails environment is running in a docker container.
  # Then wen set the variable `host_ip` to the current hosts gatway address, eg: 192.168.89.15.
  # Finaly we add this host_ip to the web_console whitelisted_ips list.
  #
  # https://stackoverflow.com/a/20012536/4862360
  if File.read('/proc/1/cgroup').include?('docker')
    # https://stackoverflow.com/a/24716645/4862360
    host_ip = `/sbin/ip route|awk '/default/ { print $3 }'`.strip

    BetterErrors::Middleware.allow_ip!(host_ip) if defined?(BetterErrors::Middleware)
    config.web_console.whitelisted_ips << host_ip
  end
end
