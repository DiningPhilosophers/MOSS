class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user

  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all

    render :layout => 'admin'
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @admin = Admin.find(params[:id])

    render :layout => 'admin'
  end

  # GET /admins/new
  def new
    @admin = Admin.new

    render :layout => 'admin'
  end

  # GET /admins/1/edit
  def edit
    render :layout => 'admin'
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      log_in @admin
      flash[:success] = "Welcome!"
      redirect_to visitors_statistics_path
    else
      render 'new'
    end

=begin
    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to visitors_statistics_path, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html {
          render :edit, :layout => 'admin'
        }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to visitors_statistics_path, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:user_name, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
