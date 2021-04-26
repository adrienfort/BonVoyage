class ExplorerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def dashboard?
    @record.id == @user.id
  end

  def research?
    return true
  end
end
