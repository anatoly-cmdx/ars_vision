class Company < ActiveRecord::Base
  has_many :people, dependent: :restrict_with_exception
end
