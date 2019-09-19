# lib/tasks/db_pull.rake
# stolen: https://martinschurig.com/posts/2015/02/pulling-production-database-to-local-machine-rails-task/
#
# Die beiden Task 'pull' und 'restore' können mit 2 Parametern aufgerufen werden:
#   :env => Die Umgebung wie 'staging', 'production'
#   :host => Der Host auf dessen Datenbank die Daten Restauriert werden sollen, default 'localhost'
namespace :db do
  desc 'Pull staging db to development'
  task :pull => [:dump, :restore]

  desc '''
Dump der Datenbank (:env) auf :host erstellen.
Beispiel Aufruf:
  `rake db:dump[production,kis]`
'''
  task :dump, [:env, :host] do |t, args|
    args.with_defaults(:env => 'staging', :host => 'stage')

    dumpfile = "#{Rails.root}/tmp/latest-#{args.env}.dump"
    puts "PG_DUMP on #{args.host}: #{args.env} database ..."
    environment = Rails.application.config.database_configuration["#{args.env}"]
    system "ssh kis@#{args.host} 'PGPASSWORD=\"#{environment['password']}\" pg_dump -U postgres #{environment['database']} -h #{environment['host']} -F t' > \"#{dumpfile}\""
    puts 'Done!'
  end

  desc '''
Restore des Dump (:env)
Beispiel Aufruf:
  `rake db:restore[production]`
'''
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
end
