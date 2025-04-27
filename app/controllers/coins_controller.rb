class CoinsController < ApplicationController
  def index
    if !current_user.present?
      redirect_to list_memes_path
    else
      redirect_to login_path
    end
  end

end
