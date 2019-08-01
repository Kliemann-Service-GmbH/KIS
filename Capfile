# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# https://github.com/capistrano/rails/blob/master/README.md
require 'capistrano/rails'
# https://github.com/capistrano/bundler/blob/master/README.md
require 'capistrano/bundler'
# https://github.com/capistrano/rvm
require 'capistrano/rvm'
# https://github.com/capistrano-plugins/capistrano-postgresql
require 'capistrano/postgresql'
# https://github.com/seuros/capistrano-puma
# https://coderwall.com/p/ttrhow/deploying-rails-app-using-nginx-puma-and-capistrano-3
require 'capistrano/puma'
# https://github.com/runar/capistrano-linked-files
require 'capistrano/linked_files'
# require "capistrano/passenger"

install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Nginx  # if you want to upload a nginx site template

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
