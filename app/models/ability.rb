class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user
    if user
      user_abilities
    else
      guest_abilities
    end
  end

  private

  def guest_abilities
  end

  def user_abilities
    alias_action :add_to_favorites, :remove_from_favorites, to: :favorites

    can :read, Company
    can :favorites, favoritables
  end

  def favoritables
    [Company, Person]
  end
end
