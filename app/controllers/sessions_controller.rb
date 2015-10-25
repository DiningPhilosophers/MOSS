class SessionsController < ApplicationController
  def new
  end
  def create
    # This is a master e-mail for loging in to administrator's section
    admin_email = 'dufek@tamu.edu' # TODO change to info@americangimuseum.org in production

    admin = Admin.find_by(user_name: admin_email)#params[:session][:user_name])
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      params[:session][:remember_me] == '1' ? remember(admin) : forget(admin)
      redirect_to admin
    else
      flash.now[:danger] = 'Invalid user name/password combination'
      render 'new'
    end
  end
  def destroy
    log_out if logged_in?
    redirect_to root_url
    end
end