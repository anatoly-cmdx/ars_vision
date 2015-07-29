class Person < ActiveRecord::Base
  belongs_to :company, required: true
end
