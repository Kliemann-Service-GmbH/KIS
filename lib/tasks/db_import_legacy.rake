require 'tiny_tds'
require 'activerecord-sqlserver-adapter'

namespace(:db) do
  namespace(:import_legacy) do
    desc "Test connection to the SQL Server"
    task test_connection: :environment do
      if db_reachable then
        puts 'database connection successful'
      else
        puts 'database not reachable, please check network!'
      end
    end # End task :test_connection

    desc "Import addresses from easyWinArt4"
    task addresses: [:environment, :test_connection] do
      results = legacy_database.execute('SELECT * FROM easyWinArtKliemann_Service_GmbH.ewa.Adressen;')
      results.each do |row|
        address = Address.find_or_create_by(id: row['AdressNummer'])
        address.address_type = "import easyWinArtKliemann_Service_GmbH"
        address.address_details = {
          'GUID': row['GUID'],
          'address_number': row['AdressNummer'],
          'customer': row['Kunde'],
          'supplier': row['Lieferant'],
          'supplier_number': row['LieferantenNummer'],
          'match_code': row['MatchCode'],
          'firm_name': row['FirmenName'],
          'street': row['Strasse'],
          'zip': row['Plz'],
          'city': row['Ort'],
          'telephone_number': row['Telefon'],
          'telephone_number2': row['Telefon2'],
          'telefax_number': row['Telefax'],
          'telefax_number2': row['Telefax2'],
          'mobile_number': row['MobilTelefon'],
          'mobile_number2': row['MobilTelefon2'],
          'email': row['Email'],
          'email2': row['Email2'],
          'web': row['WebAdresse'],
          'web2': row['WebAdresse2'],
          'UStIdNr': row['UStIdNr'],
          'email_invoice': row['EmailBuchhaltung']
        }
        address.save!
      end
      puts "%d rows affected in SQL database" % results.affected_rows
      puts "(%d) Adressen" % Address.all.size
    end # End task :addresses

    desc "Create customers from addresses"
    task customers: [:environment, :addresses] do
      Address.where("address_details->'customer' = 'true'").each do |address|
        customer = Customer.find_or_create_by(id: address.id)
        customer.address=(address)
        customer.save!
      end
      puts "%d Adressen" % Address.all.size
      puts "%d Kunden" % Customer.all.size
    end # End task :customers
  end # End namespace(:import_legacy)
end # End namespace(:db)




def legacy_database
  @client = TinyTds::Client.new(
    username: Rails.application.credentials[:legacy_database][:username],
    password: Rails.application.credentials[:legacy_database][:password],
    host: Rails.application.credentials[:legacy_database][:host],
    port: Rails.application.credentials[:legacy_database][:port]
  )
  puts 'Connecting to SQL Server ...'
  puts 'Done' if @client.active? == true

  @client
end

def db_reachable
  Socket.tcp(
    Rails.application.credentials[:legacy_database][:host],
    Rails.application.credentials[:legacy_database][:port],
    connect_timeout: 3
  ) { true }
end
