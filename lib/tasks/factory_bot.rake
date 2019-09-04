# lib/tasks/factory_bot.rake
namespace :factory_bot do
  desc "Verify that all FactoryBot factories are valid"
  task lint: :environment do
    factories_to_lint = FactoryBot.factories.reject do |factory|
      factory.name =~ /^old_/
    end

    if Rails.env.test?
      conn = ActiveRecord::Base.connection
      conn.transaction do
        # FactoryBot.lint
        # FactoryBot.lint verbose: true
        # FactoryBot.lint factories_to_lint
        # FactoryBot.lint factories_to_lint, traits: true
        FactoryBot.lint factories_to_lint, traits: true, verbose: true
        raise ActiveRecord::Rollback
      end
    else
      system("bundle exec rake factory_bot:lint RAILS_ENV='test'")
      fail if $?.exitstatus.nonzero?
    end
  end
end
