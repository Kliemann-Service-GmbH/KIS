namespace :release do

  desc "bump VERSION. Use BUILD_VERSION to override defaults"
  task :bump_version do

    version_file = "#{Rails.root}/config/initializers/version.rb"
    version = ENV["VBUILD_ERSION"] || `git describe --always --tags`
    version_string = "VERSION = \"#{version.strip}\"\n"
    File.open(version_file, "w") {|f| f.print(version_string)}
    $stderr.print(version_string)
  end
end
