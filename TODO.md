# TODO

## [High priority]
* Notification Mailer
  * `rails generate mailer Notification service_contract_expired`
  * DEBUG
    * File `config/environment/development`
    * `config.action_mailer.raise_delivery_errors = true # false per default`
  * SMTP delivery methodes
    * File `config/environment/development`
    * `config.action_mailer.delivery_method = ` ???
    * config.action_mailer.smtp_settings = {
        address:,
        port:,
        domain:,
        authentication: "plain",
        enable_starttls_auto: true,
        user_name: ENV["GMAIL_USERNAME"],
        password: ENV["GMAIL_PASSWORD"],
    }
  * Mailer URLs
    * File `config/environment/development`
    * `config.action_mailer.default_url_options = {host: "localhost:3000"}`
  * Test mailers
    * Railscast 275
* Background Jobs
  * Railscast

* Was ist ein Model Observer
* Wie geht ein Callback
* Refactor
  * vom Controller in die Models (lange Funktionen, komplizierte Logic)
    ```
    # create a class method
    def self.refactor(params)
    end
    ```

## [Low priority]
* cypress.io Rails integration https://github.com/shakacode/cypress-on-rails
* cypress.io Tests
