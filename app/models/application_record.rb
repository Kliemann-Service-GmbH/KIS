class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #https://stackoverflow.com/questions/18747062/rails-create-or-update-magic
  def self.update_or_create_by(args, attributes)
    obj = self.find_or_create_by(args)
    obj.update(attributes)
    return obj
  end
end
