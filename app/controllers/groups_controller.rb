class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    # Get the questions for the survey from the database
    @questions = Question.all

    # Create a new group
    @group = Group.new
    # Create a new visitors reference
    @group.visitors.new

    # Create a new surveys reference for storing answers to the questions
    @group.surveys.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    # If no group size is specified, consider it group of 1
    @group.group_size = 1 if @group.group_size == nil

    # @group.visitors.first.zip_code = '00000' if @group.visitors.first.zip_code == nil
    respond_to do |format|
      if @group.save
        format.html { redirect_to sign_in_path, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      # We are taking in parameters also for visitors and surveys
      params.require(:group).permit( :group_size, :visit_date, visitors_attributes: [:last_name, :first_name, :group_id, :email, :contact, :zip_code, :country_id], surveys_attributes: [:group_id, :question_id, :answer])
    end
end
