class VisitorsController < ApplicationController
  before_action :set_visitor, only: [:show, :edit, :update, :destroy]

  # GET /visitors
  # GET /visitors.json
  def index
    @start_date = params[:start_date]
    @end_date = params[:end_date]

    session.delete(:some_key)
    start_date_remembered = @start_date.blank? && session[:start_date].present?
    end_date_remembered = @end_date.blank? && session[:end_date].present?
    if start_date_remembered || end_date_remembered
      @start_date = session[:start_date] if start_date_remembered
      @end_date = session[:end_date] if end_date_remembered
    
      flash.keep
      redirect_to :start_date => @start_date, :end_date => @end_date and return
    end

    if !@start_date.blank? && !@end_date.blank?
      @visitors = Visitor.where(:created_at => @start_date..@end_date)
    else
      @visitors = Visitor.all
    end
    
    session[:start_date] = @start_date
    session[:end_date] = @end_date
  end

  # GET /visitors/1
  # GET /visitors/1.json
  def show
  end

  # GET /visitors/new
  def new
    @visitor = Visitor.new
  end

  # GET /visitors/1/edit
  def edit
  end

  # POST /visitors
  # POST /visitors.json
  def create
    @visitor = Visitor.new(visitor_params)

    respond_to do |format|
      if @visitor.save
        format.html { redirect_to @visitor, notice: 'Visitor was successfully created.' }
        format.json { render :show, status: :created, location: @visitor }
      else
        format.html { render :new }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitors/1
  # PATCH/PUT /visitors/1.json
  def update
    respond_to do |format|
      if @visitor.update(visitor_params)
        format.html { redirect_to @visitor, notice: 'Visitor was successfully updated.' }
        format.json { render :show, status: :ok, location: @visitor }
      else
        format.html { render :edit }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitors/1
  # DELETE /visitors/1.json
  def destroy
    @visitor.destroy
    respond_to do |format|
      format.html { redirect_to visitors_url, notice: 'Visitor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor
      @visitor = Visitor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitor_params
      params.require(:visitor).permit(:last_name, :first_name, :group_id, :email, :contact, :zip_code, :country_id)
    end
end
