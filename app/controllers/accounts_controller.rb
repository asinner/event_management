class AccountsController < ApplicationController
  def new
    @account = Account.new
    @account.users.build
  end
  
  def create
    @account = Account.new(account_params)
    @user = @account.users.first
    
    if @account.save
      sign_in(:user, @user)
      redirect_to accounts_path, notice: 'You have successfully created your account'
    else
      render :new
    end
  end
  
  def index
  end
  
  private
  
  def account_params
    params.require(:account).permit(users_attributes: [:email, :password, :password_confirmation])
  end
end
