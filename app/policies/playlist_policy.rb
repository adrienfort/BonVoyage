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
    record.explorer_id === user.id
  end

  def show?
    record.explorer.id === user.id
  end

  def edit?
    if (record.name != "Bon Voyage")
      return record.explorer.id === user.id
    end
    false
  end

  def update?
    if (record.name != "Bon Voyage")
      return record.explorer.id === user.id
    end
    false
  end

  def destroy?
    if (record.name != "Bon Voyage")
      return record.explorer.id === user.id
    end
    false
  end

end
