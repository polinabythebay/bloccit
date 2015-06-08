class CommentPolicy < ApplicationPolicy

  def new?
    create?
  end

  def create?
    user.present?
  end

  def show?
    create?
  end
end
