class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user
        scope.where(account_id: @user.account.id)
      end
    end
  end
  
  def edit?
    @user.account.events.include?(@record) if @user.account
  end
  
  def update?
    edit?
  end
  
  def destroy?
    edit?
  end
end
