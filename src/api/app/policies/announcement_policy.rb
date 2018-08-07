class AnnouncementPolicy < ApplicationPolicy
  def index?
    @user.is_admin?
  end

  def new?
    index?
  end

  def show?
    index?
  end

  def edit?
    index?
  end

  def create?
    index?
  end

  def update?
    index?
  end
end
