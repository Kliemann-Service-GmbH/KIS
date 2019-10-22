class StaticPageController < ApplicationController
  def about
    @about = File.read("#{Rails.root}/README.md")
  end

  def changelog
    @changelog = File.read("#{Rails.root}/CHANGELOG.md")
  end

  def license
    @license = File.read("#{Rails.root}/LICENSE")
  end
end
