class Favorite < ActiveRecord::Base
  include Authorable

  belongs_to :favoritable, polymorphic: true
  validates :user_id, uniqueness: { scope: [:favoritable_id, :favoritable_type] }
end
