class UsersController < ApplicationController
  before_action :set_user
  before_action :ensure_super_user

  def index
    @users = User.all
  end

  def show
    
  end

  private
  
  def set_user
    id = params[:id]
    if id
      @user = User.find_by_id(id)
    end
  end

  # def user_params
  #   params.expect(user: [ :hide_crypto_info, :firstname, :lastname, :role, :email, :login, :password, :balance, :tg_chat_id, :api, :s_key ])
  # end
end
