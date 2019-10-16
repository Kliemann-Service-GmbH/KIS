class ApplicationController < ActionController::Base
  # before_action :set_locale
  # def set_locale
  #   I18n.locale = params[:locale] || I18n.default_locale
  # end

  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  private

  # http://railscasts.com/episodes/127-rake-in-background?
  def call_rake(task, options = {})
    logfilename = "#{Rails.root}/log/rake.log".freeze
    options[:rails_env] = Rails.env
    args = options.map { |n, v| "#{n.to_s.upcase}='#{v}'" }
    File.open(logfilename, 'a') { |file| file.write("#{Time.now.strftime("%F %H:%M:%S")} ") }
    File.open(logfilename, 'a') { |file| file.write("#{request.remote_ip} ") }
    # FIXME: --trace makes noise in `rspec spec` runs
    #system "bundle exec rake #{task} #{args.join(' ')} --trace >> \"#{logfilename}\" &"
    system "bundle exec rake #{task} #{args.join(' ')} >> \"#{logfilename}\" &"
  end

end
