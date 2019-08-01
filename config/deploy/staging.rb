server "192.168.89.13", user: "kis", roles: %w{app db web}

set :stage, :staging

set :branch, "development"


#set :pg_generate_random_password, true # Generates a random password on each setup
set :pg_password, ENV['POSTGRES_PASSWORD_STAGING']
set :pg_extensions, ['hstore']
set :pg_encoding, 'UTF-8'
set :pg_pool, '100'
