server "35.196.103.88", user: "smueller", roles: %w{app db web}

set :stage, :staging

set :pg_generate_random_password, true # Generates a random password on each setup
