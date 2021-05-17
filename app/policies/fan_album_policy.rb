class FanAlbumPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.explorer_id == user.id
  end

  def destroy?
    record.explorer_id == user.id
  end
end
