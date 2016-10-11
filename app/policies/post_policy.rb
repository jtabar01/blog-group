class PostPolicy < ApplicationPolicy
  def initialize(current_user, record)
    @current_user = current_user
    @record = record
  end

  def new?
  end

  def create?
    user.has_role? :admin or user.has_role? :poster
  end

  def update?
    user.has_role? :admin or (user.has_role? :poster and record.user_id==user.id)
  end
  def destroy?
    user.has_role? :admin or (user.has_role? :poster and record.user_id==user.id)
  end
end
