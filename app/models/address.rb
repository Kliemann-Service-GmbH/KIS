# == Schema Information
#
# Table name: addresses
#
#  id              :bigint           not null, primary key
#  address_details :hstore
#  address_type    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Address < ApplicationRecord
  # Associations

  # Validations

# Full-Text search in PostgreSQL database
  include PgSearch::Model
  multisearchable against: [:address_details]

  pg_search_scope :search_full_text, against: [:address_details],
    using: {
      tsearch: {
        prefix: true,
        negation: true,
        any_word: true
      }
    }

  # Virtual Attributes
  def full_name
    return "" if address_details.nil?
    name = ""
    name << "#{address_details['prefix']} " if address_details['prefix'].present?
    name << "#{address_details['first_name']} " if address_details['first_name'].present?
    name << "#{address_details['last_name']}" if address_details['last_name'].present?
  end

  def address_number
    return id if address_details.nil?
    "#{address_details['address_number']}"
  end

  def email_address
    return "" if address_details.nil?
    "#{address_details['email_address']}"
  end

  def telephone_number
    return "" if address_details.nil?
    "#{address_details['telephone_number']}"
  end

  def mobile_number
    return "" if address_details.nil?
    "#{address_details['mobile_number']}"
  end

  def short_name
    return "" if address_details.nil?
    first_name = address_details["first_name"]
    last_name = address_details["last_name"]
    if first_name && last_name
      "#{first_name} #{last_name}"
    elsif first_name
      "#{first_name}"
    elsif last_name
      "#{last_name}"
    else
      ""
    end
  end

  def match_code
    return "" if address_details.nil?
    "#{address_details["match_code"]}"
  end

  def street
    return "" if address_details.nil?
    "#{address_details["street"]}"
  end

  def zip_city
    return "" if address_details.nil?
    zip = address_details["zip"]
    city = address_details["city"]
    if zip && city
      "#{address_details["zip"]}, #{address_details["city"]}"
    elsif zip
      "#{zip}"
    elsif city
      "#{city}"
    else
      ""
    end
  end

  def post_address
    return "" if address_details.nil?
    address = ""
    address << "#{full_name}\n" unless full_name.blank?
    address << "#{street}\n" unless street.blank?
    address << "#{zip_city}" unless zip_city.blank?
    address
  end

  # Address Line is either, 'address_number', 'address_number - match_code' or just 'full_name'
  def address_line
    return "" if address_details.nil?
    line = ""
    line << "#{address_number}"
    if address_details["match_code"].present?
      line << " - #{address_details["match_code"]}"
    else
      line << "#{full_name}"
    end
  end
end
