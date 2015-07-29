class Person < ActiveRecord::Base
  include Favoritable

  belongs_to :company, required: true

  validates :first_name, :last_name, presence: true
end
