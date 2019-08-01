set :user,            "kis"
set :repo_url,        "git@github.com:Kliemann-Service-GmbH/KIS.git"
set :application,     "kis"
set :puma_threads,    [4, 16]
set :puma_workers,    0

set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true

set :pg_username,     "postgres"
set :pg_password,     "example"
set :pg_without_sudo,  false
set :pg_extensions,    ['hstore']

# Default branch is :master
set :branch,          "master"
#ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Check and create shared folder
namespace :deploy do
  before :check, 'deploy:check_create_shared'

  desc 'Check and create shared/config'
  task :check_create_shared do
    on roles(:all) do
      execute :mkdir, '-p', "#{shared_path}/config"
    end
  end
end

namespace :deploy do
  desc 'Runs any rake task, cap deploy:rake task=db:rollback'
  task rake: [:set_rails_env] do
    on release_roles([:db]) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          # execute :rake, ENV['task']
          execute :rake, ENV['task']
        end
      end
    end
  end
  # # Uploading both linked_files and dirs
  # before :finishing, 'linked_files:upload'
  # Uploading only linked_files
  before :check, 'linked_files:upload_files'
  # before :finishing, 'linked_files:upload_files'
  # # Uploading only dirs
  # before :finishing, 'linked_files:upload_dirs'
end

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# "config/database.yml" does'n have to been added in linked_files array (see: https://github.com/capistrano-plugins/capistrano-postgresql)
append :linked_files, 'config/master.key'
append :linked_dirs, '.bundle'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :migration_role, :app
