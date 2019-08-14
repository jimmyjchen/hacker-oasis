class NotificationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def mark_as_read?
    true
  end

  # def show?
  #   return true
  # end

  # def create?
  #   return true
  # end

  # def update?
  #   record.user == user
  # end

  # def destroy?
  #   record.user == user
  # end
end
