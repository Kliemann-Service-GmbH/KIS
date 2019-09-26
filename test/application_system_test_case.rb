require "test_helper"
# require "capybara/poltergeist"
require 'capybara/apparition'
require 'capybara/rails'
require 'capybara/minitest'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :firefox, screen_size: [2000, 2000]
  # driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  # driven_by :poltergeist, screen_size: [1400, 1400], options: { js_errors: true }

  Capybara.register_driver :apparition do |app|
    Capybara::Apparition::Driver.new(app, { headless: false, debug: true, screen_size: [2000, 2000] })
  end
end
