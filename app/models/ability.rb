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
    can :read, Company
  end
end
