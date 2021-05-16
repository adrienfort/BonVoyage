class AlbumPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show_artist?
    record.artist_id == user.id
  end

  def show_explorer?
    true
  end

  def new?
    true
  end

  def create?
    record.artist.id == user.id
  end

  def edit?
    record.artist.id == user.id
  end

  def update?
    record.artist.id == user.id
  end

  def destroy?
    record.artist.id == user.id
  end
end
