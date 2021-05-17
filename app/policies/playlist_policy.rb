class PlaylistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    record.explorer_id == user.id
  end

  def show?
    record.explorer.id == user.id
  end
end
