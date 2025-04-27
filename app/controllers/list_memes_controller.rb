class ListMemesController < ApplicationController
  def index
    if !current_user.present?
      redirect_to login_path
    end
  end
end
