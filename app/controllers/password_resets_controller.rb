class PasswordResetsController < ApplicationController
  before_action :get_admin, only: [:edit, :update]
  before_action :valid_admin, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def edit
  end

  def create
    admin_email = 'dufek@tamu.edu' # TODO PRODUCTION change to info@americangimuseum.org in production
    @admin = Admin.find_by(user_name: admin_email)
    if @admin
      @admin.create_reset_digest
      @admin.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Administrator not found"
      render 'new'
    end
  end

  def update
    if password_blank?
      flash.now[:danger] = "Password can't be blank"
      render 'edit'
    elsif @admin.update_attributes(admin_params)
      log_in @admin
      flash[:success] = "Password has been reset."
      redirect_to visitors_path
    else
      render 'edit'
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:password, :password_confirmation)
  end

  # Returns true if password is blank.
  def password_blank?
    params[:admin][:password].blank?
  end

  def get_admin
    @admin = Admin.find_by(user_name: params[:user_name])
  end

  # Confirms a valid user.
  def valid_admin
    unless (@admin && @admin.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  # Checks expiration of reset token.
  def check_expiration
    if @admin.password_reset_expired?
      flash[:danger] = "Password reset has expired."
      redirect_to new_password_reset_url
    end
  end
end
