module Favoritable
  extend ActiveSupport::Concern

  included do
    has_many :favorites, as: :favoritable, dependent: :destroy
  end

  def add_to_favorites(user)
    favorites.create(user: user)
    self
  end

  def remove_from_favorites(user)
    favorites.where(user: user).delete_all
    self
  end

  def favorited_by?(user)
    favorites.where(user: user).any?
  end
end
