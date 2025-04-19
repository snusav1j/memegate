class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
  protect_from_forgery with: :exception
  before_action :set_global_vars
  before_action :set_cache_headers
  before_action :create_super_user


  def create_super_user
    user_present = User.find_by(email: "admin@meme.gate")
    if !user_present.present?
      User.create!(
        email: 'admin@meme.gate',
        password: 'm3m1G4_t3',
        password_confirmation: 'm3m1G4_t3',
        role: 'dev',
        firstname: 'meme',
        lastname: 'gate'
      )
    end
  end
  
  def ensure_super_user
    if current_user
      if !current_user.have_super_permission?
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def set_global_vars
    @http_host = request.env['HTTP_HOST']
    @cur_url = request.env['REQUEST_URI']
		@ref_url = request.env['HTTP_REFERER']
  end
  
  private

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Mon, 01 Jan 1990 00:00:00 GMT"
  end
end
