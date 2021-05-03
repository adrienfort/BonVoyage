class ExplorerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def dashboard?
    @record.id == @user.id
  end

  def research?
    false
  end
end
