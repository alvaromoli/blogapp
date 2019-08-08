# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    return unless user.present?
    can :manage, Post, user_id: user.id
    can :create, Comment
    return unless user.admin?
    can :manage, :all
    can :read, :dashboard
  end
end
