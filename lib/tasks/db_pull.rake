# lib/tasks/db_pull.rake
# https://martinschurig.com/posts/2015/02/pulling-production-database-to-local-machine-rails-task/
namespace :db do
  desc 'Pull staging db to development'
  task :pull => [:dump, :restore]

  task :dump do
    dumpfile = "#{Rails.root}/tmp/latest-staging.dump"
    puts 'PG_DUMP on staging database...'
    staging = Rails.application.config.database_configuration['staging']
    system "ssh kis@192.168.89.13 'PGPASSWORD=\"#{staging['password']}\" pg_dump -U postgres #{staging['database']} -h #{staging['host']} -F t' > \"#{dumpfile}\""
    puts 'Done!'
  end

  task :restore do
    development = Rails.application.config.database_configuration['development']
    dumpfile = "#{Rails.root}/tmp/latest-staging.dump"
    puts 'PG_RESTORE on development database...'
    system "pg_restore --verbose --clean --no-acl --no-owner -h #{development['host']} -p #{development['port']} -U #{development['username']} -d #{development['database']} \"#{dumpfile}\""
    puts 'Done!'
  end
end
