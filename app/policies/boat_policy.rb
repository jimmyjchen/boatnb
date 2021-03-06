class BoatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  def tagged?
    true
  end

  private

  def user_is_owner_or_admin?
    return false if user.nil?

    record.user == user || user.admin
  end
end
