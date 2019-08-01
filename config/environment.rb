# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# custom version number (see: https://stackoverflow.com/questions/1047943/best-way-to-version-a-rails-app/6178378#6178378)
APP_VERSION = `git describe --always` unless defined? APP_VERSION
