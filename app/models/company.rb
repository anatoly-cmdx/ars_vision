class Company < ActiveRecord::Base
  include Favoritable

  has_many :people, dependent: :restrict_with_exception

  FIELD_FORMAT = {
    country_code: /\A[a-z]{2}\z/i
  }

  validates :country_code, presence: true, format: FIELD_FORMAT[:country_code]
  validates :name, presence: true
end
