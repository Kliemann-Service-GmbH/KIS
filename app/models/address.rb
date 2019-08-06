class Address < ApplicationRecord
  # Associations

  # Validations

# Full-Text search in PostgreSQL database
  include PgSearch
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
  def address_number_match_code
    "##{address_details['address_number']} - #{address_details['match_code']}"
  end

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
    "#{match_code}\n#{short_name}\n#{street}\n#{zip_city}"
  end

  # Address Line, address_number - Matchcode or Fullname
  def address_line
    return "" if address_details.nil?
    line = ""
    line << "#{address_number} - "
    if address_details["match_code"].present?
      line << "#{address_details["match_code"]}"
    else
      line << "#{full_name}"
    end
  end
end
