class PlaylistMusicPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    record.playlist.explorer.id == user.id
  end

  def destroy
    raise
  end
end
