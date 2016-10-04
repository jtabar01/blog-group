class PostPolicy < ApplicationPolicy
  def initialize(current_user, record)
    @current_user = current_user
    @record = record
  end

  def new?
    
  end

end
