class AmusementPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
