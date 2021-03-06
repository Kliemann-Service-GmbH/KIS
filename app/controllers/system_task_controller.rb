class SystemTaskController < ApplicationController
  def db_import_legacy
    unless Rails.env.test?
      call_rake 'db:import_legacy:customers'
      flash[:notice] = t("Database synchronization started")
    end

    # https://blog.bigbinary.com/2016/02/29/rails-5-improves-redirect_to_back-with-redirect-back.html
    redirect_back(fallback_location: root_path)
  end
end
