class PostPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user, @scope = user, scope
    end

    def resolve
      if user.admin? or user.moderator?
        scope.all
      elsif user.member?
        scope.where(user_id: @user.id)
      else
        scope.none
      end
    end
  end

  def index?
    true
  end

end