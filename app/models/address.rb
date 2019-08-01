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
  def full_name
    name = ""
    name << "#{address_details['prefix']} " if address_details['prefix'].present?
    name << "#{address_details['first_name']} " if address_details['first_name'].present?
    name << "#{address_details['last_name']}" if address_details['last_name'].present?
  end

  def address_number
    "#{address_details['address_number']}"
  end

  def email_address
    "#{address_details['email_address']}"
  end

  def telephone_number
    "#{address_details['telephone_number']}"
  end

  def mobile_number
    "#{address_details['mobile_number']}"
  end

  def short_name
    first_name = address_details["first_name"]
    last_name = address_details["last_name"]
    if first_name && last_name
      "#{first_name} #{last_name}"
    elsif first_name
      first_name
    elsif last_name
      last_name
    else
      ""
    end
  end

  def match_code
    "#{address_details["match_code"]}"
  end

  def street
    if address_details["street"].nil?
      ""
    else
      "#{address_details["street"]}"
    end
  end

  def zip_city
    if address_details["zip"].nil? || address_details["city"].empty?
      ""
    else
      "#{address_details["zip"]}, #{address_details["city"]}"
    end
  end

  def post_address
    "#{match_code}\n#{short_name}\n#{street}\n#{zip_city}"
  end

  # Address Line, address_number - Matchcode or Fullname
  def address_line
    line = ""
    line << "#{address_number} - "
    if address_details["match_code"].present?
      line << "#{address_details["match_code"]}"
    else
      line << "#{full_name}"
    end
  end
end
