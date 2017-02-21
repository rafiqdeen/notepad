module SessionsHelper
  def session_active?
    if session[:user_id]
      true
    else
      false
    end
  end
end
