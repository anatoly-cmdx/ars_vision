class Person < ActiveRecord::Base
  belongs_to :company, required: true

  validates :first_name, :last_name, presence: true
end
