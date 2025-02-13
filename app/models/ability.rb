# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.super_admin?
      can :manage, :all
    elsif user.admin?
      can :manage, Book, library_id: user.library_id
      can :read, Libaray, id: user.library_id
    else
      can: :read, Book
      can: :read, Libaray
    
  end
end
