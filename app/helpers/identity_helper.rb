module IdentityHelper
  def current_user
    request.env['username']
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    redirect_to '/403' unless logged_in? && available_session?
  end

  def expire_session?
    request.env['is_expire']
  end

  def available_session?
    !expire_session?
  end
end
