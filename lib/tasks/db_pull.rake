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
Dump der Datenbank (:env) auf (:host) erstellen.
Beispiel Aufruf:
  `rake db:dump[production,kis]`
'''
  task :dump, [:env, :host] do |t, args|
    args.with_defaults(:env => 'staging', :host => 'stage')
    dumpfile = "#{Rails.root}/tmp/latest-#{args.env}.dump"
    # FIXME: Check and exception if credentials not set `rails credentials:edit`
    database = Rails.application.credentials[args.env.to_sym][:postgres][:database]
    username = Rails.application.credentials[args.env.to_sym][:postgres][:username]
    password = Rails.application.credentials[args.env.to_sym][:postgres][:password]

    puts "PG_DUMP on host: [#{args.host}] and database: [#{args.env}] ..."
    system "ssh kis@#{args.host} pg_dump postgresql://#{username}:#{password}@127.0.0.1:5432/#{database} -Ft > \"#{dumpfile}\""
    puts 'Done!'
  end

  desc '''
Restore des Dump (:from) auf die Datenbank (:to)
Beispiel Aufruf:
  `rake db:restore[production,development]`
'''
  task :restore, [:from, :to] do |t, args|
    args.with_defaults(:from => 'staging', :to => 'development')
    dumpfile = "#{Rails.root}/tmp/latest-#{args.from}.dump"
    # FIXME: Check and exception if credentials not set `rails credentials:edit`
    database = Rails.application.credentials[args.to.to_sym][:postgres][:database]
    username = Rails.application.credentials[args.to.to_sym][:postgres][:username]
    password = Rails.application.credentials[args.to.to_sym][:postgres][:password]

    puts "PG_RESTORE from [#{args.from}] database to [#{args.to}] database ..."
    system "pg_restore --verbose --clean --no-acl --no-owner -h localhost -p 54321 -U #{username} -d #{database} \"#{dumpfile}\""
    puts 'Done!'
  end
end
