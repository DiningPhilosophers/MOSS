require 'bcrypt'

module SessionsHelper
  # Logs in the given admin.
  def log_in(admin)
    session[:admin_id] = admin.id
  end

  # Remembers a admin in a persistent session.
  def remember(admin)
    admin.remember
    cookies.permanent.signed[:admin_id] = admin.id
    cookies.permanent[:remember_token] = admin.remember_token
  end

  # Returns the admin corresponding to the remember token cookie.
  def current_admin
    if (admin_id = session[:admin_id])
      @current_admin ||= Admin.find_by(id: admin_id)
    elsif (admin_id = cookies.signed[:admin_id])
      admin = Admin.find_by(id: admin_id)
      if admin && admin.authenticated?(cookies[:remember_token])
        log_in admin
        @current_admin = admin
      end
    end
  end

  # Returns true if the admin is logged in, false otherwise.
  def logged_in?
    !current_admin.nil?
  end
  # Returns the hash digest of the given string.
  def Admin.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Forgets a persistent session. def forget(admin)
  def forget(admin)
    admin.forget
    cookies.delete(:admin_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_admin)
    session.delete(:admin_id)
    @current_admin = nil
  end
end