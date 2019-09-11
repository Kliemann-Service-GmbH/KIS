# lib/tasks/db_pull.rake
# https://martinschurig.com/posts/2015/02/pulling-production-database-to-local-machine-rails-task/
namespace :db do
  desc 'Pull staging db to development'
  task :pull => [:dump, :restore]

  task :dump, [:env, :host] do |t, args|
    args.with_defaults(:env => 'staging', :host => 'stage')

    dumpfile = "#{Rails.root}/tmp/latest-#{args.env}.dump"
    puts "PG_DUMP on #{args.env} database..."
    environment = Rails.application.config.database_configuration["#{args.env}"]
    system "ssh kis@#{args.host} 'PGPASSWORD=\"#{environment['password']}\" pg_dump -U postgres #{environment['database']} -h #{environment['host']} -F t' > \"#{dumpfile}\""
    puts 'Done!'
  end

  task :restore, [:env] do |t, args|
    args.with_defaults(:env => 'staging')

    development = Rails.application.config.database_configuration['development']
    dumpfile = "#{Rails.root}/tmp/latest-#{args.env}.dump"
    puts "PG_RESTORE on #{args.env} database..."
    environment = Rails.application.config.database_configuration["#{args.env}"]
    # system "PGPASSWORD=\"#{environment['password']}\" pg_restore --verbose --clean --no-acl --no-owner -h #{development['host']} -p #{development['port']} -U #{development['username']} -d #{development['database']} \"#{dumpfile}\""
    system "pg_restore --verbose --clean --no-acl --no-owner -h #{development['host']} -p #{development['port']} -U #{development['username']} -d #{development['database']} \"#{dumpfile}\""
    puts 'Done!'
  end

  desc 'Test task parameters\nParams: [:environment]'
  task :test_params, [:env] do |t, args|
    args.with_defaults(:env => 'staging')
    puts "First param: #{args.env}"
  end
end
