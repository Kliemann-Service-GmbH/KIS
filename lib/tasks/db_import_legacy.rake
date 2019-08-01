require 'tiny_tds'
require 'activerecord-sqlserver-adapter'

namespace(:db) do
  namespace(:import_legacy) do
    desc "Test connection to the SQL Server"
    task test: :environment do
      if db_reachable then
        puts 'database connection successful'
      else
        puts 'no successful connection possible, check network!'
      end
    end # End task :test

    desc "Import addresses from easyWinArt4"
    task addresses: [:environment, :test] do
      results = legacy_database.execute('SELECT * FROM easyWinArtKliemann_Service_GmbH.ewa.Adressen;')
      results.each do |row|
        Address.find_or_create_by(id: row['AdressNummer']) do |address|
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
        end
      end
      puts "%d rows affected in SQL database" % results.affected_rows
      puts "(%d) Adressen" % Address.all.size
    end # End task :addresses

    desc "Create customers from addresses"
    task customers: [:environment, :addresses] do
      Address.where("address_details->'customer' = 'true'").each do |address|
        Customer.find_or_create_by(id: address.id) do |customer|
          customer.address=(address)
          customer.save!
        end
      end
      puts "%d Adressen" % Address.all.size
      puts "%d Kunden" % Customer.all.size
    end # End task :customers
  end # End namespace(:import_legacy)
end # End namespace(:db)




def legacy_database
  @client = TinyTds::Client.new(username: 'sa', password: '$easyWinArt4', host: '192.168.89.202', port: 50740)
  puts 'Connecting to SQL Server'

  if @client.active? == true then puts 'Done' end
  @client
end

def db_reachable
  Socket.tcp("192.168.89.202", 50740, connect_timeout: 3) { true }
end
