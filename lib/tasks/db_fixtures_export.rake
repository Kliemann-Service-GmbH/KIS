namespace 'db:fixtures' do
  desc "generate fixtures from the current database"

  task :export => :environment do
    Rails.application.eager_load!
    models = defined?(ApplicationRecord) ? ApplicationRecord.descendants : ActiveRecord::Base.descendants

    models.each do |model|
      next unless model.table_exists?
      puts "exporting: #{model}"

      filepath = Rails.root.join('spec/fixtures', "#{model.name.underscore}.yml")
      FileUtils.mkdir_p filepath.dirname

      filepath.open('w') do |file|
        hash = {}

        unless model.primary_key
          model.primary_key = model.columns.first.name
          join_table = true
        end

        model.find_each do |r|
          key = if join_table
                  ids = model.columns.map { |col| r.send(col.name) }.join('_')
                  "#{filepath.basename('.*')}_#{ids}"
                else
                  r.try(:name) || "#{filepath.basename('.*')}_#{r.id}"
                end
          hash[key] = r.attributes.except(:password_digest)
        end
        file.write hash.to_yaml
      end
    end
  end
end
