class HackerDayPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    return true
  end

  def show
    return true
  end

  def create
    # record is what comes after the @
    record.project.user == user
  end

  def update?
    return true
  end

  def destroy?
    record.project.user == user
  end
end
