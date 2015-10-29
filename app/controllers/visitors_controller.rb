class VisitorsController < ApplicationController
  before_action :set_visitor, only: [:show, :edit, :update, :destroy]

  # GET /visitors
  # GET /visitors.json
  # def index
  #   @start_date = params[:start_date]
  #   @end_date = params[:end_date]
  #   @area = params[:area]
  #
  #   session.delete(:some_key)
  #   start_date_remembered = @start_date.blank? && session[:start_date].present?
  #   end_date_remembered = @end_date.blank? && session[:end_date].present?
  #   area_remembered = @area.blank? && session[:area].present?
  #   if start_date_remembered || end_date_remembered || area_remembered
  #     @start_date = session[:start_date] if start_date_remembered
  #     @end_date = session[:end_date] if end_date_remembered
  #     @area = session[:area] if area_remembered
  #
  #     flash.keep
  #     redirect_to :area => @area, :start_date => @start_date, :end_date => @end_date and return
  #     #redirect_to :start_date => @start_date, :end_date => @end_date and return
  #   end
  #
  #   if !@start_date.blank? && !@end_date.blank?
  #     # @start_date = DateTime.strptime(@start_date,'%m/%d/%Y')
  #     # @end_date = DateTime.strptime(@end_date,'%m/%d/%Y')
  #     # @visitors = Visitor.where(:created_at => @start_date.beginning_of_day..@end_date.end_of_day)
  #     @visitors = Visitor.where(:created_at => @start_date..@end_date)
  #   else
  #     @visitors = Visitor.all
  #   end
  #
  #   session[:start_date] = @start_date
  #   session[:end_date] = @end_date
  #   session[:ara] = @area
  # end

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
      #redirect_to :start_date => @start_date, :end_date => @end_date and return
    end

    if !@start_date.blank? && !@end_date.blank?
      # @start_date = DateTime.strptime(@start_date,'%m/%d/%Y')
      # @end_date = DateTime.strptime(@end_date,'%m/%d/%Y')
      # @visitors = Visitor.where(:created_at => @start_date.beginning_of_day..@end_date.end_of_day)
      @visitors = Visitor.where(:created_at => @start_date..@end_date)
    else
      @visitors = Visitor.all
    end

    session[:start_date] = @start_date
    session[:end_date] = @end_date
  end

  def filter_area
    # start_date_remembered = @start_date.blank? && session[:start_date].present?
    # end_date_remembered = @end_date.blank? && session[:end_date].present?
    # @start_date = session[:start_date] if start_date_remembered
    # @end_date = session[:end_date] if end_date_remembered
    @df = Array.new
    @df <<'Addison'<<'Allen'<<'Carrollton'<<'Celina'<<'Coppell'<<'Flower Mound'<<'Plano'<<'Rockwall'<<'Frisco'<<'Irving'<<'Garland'<<'Sachse'<<'Grand Prairie'<<'The Colony'<<'Lewisville'<<'Lake Dallas'<<'Little Elm'<<'Mckinney'<<'Prosper'<<'Richardson'<<'Rowlett'<<'Wylie'<<'Bardwell'<<'Cedar Hill'<<'Crandall'<<'Desoto'<<'Duncanville'<<'Ennis'<<'Ferris'<<'Forney'<<'Fate'<<'Lancaster'<<'Caddo Mills'<<'Hutchins'<<'Kaufman'<<'Mabank'<<'Mesquite'<<'Palmer'<<'Red Oak'<<'Rosser'<<'Scurry'<<'Seagoville'<<'Terrell'<<'Josephine'<<'Waxahachie'<<'Lavon'<<'Wilmer'<<'Nevada'<<'Sunnyvale'<<'Royse City'<<'Dallas'<<'Greenville'<<'Princeton'<<'Anna'<<'Ben Franklin'<<'Campbell'<<'Celeste'<<'Blue Ridge'<<'Commerce'<<'Cooper'<<'Enloe'<<'Farmersville'<<'Klondike'<<'Lake Creek'<<'Lone Oak'<<'Melissa'<<'Pecan Gap'<<'Quinlan'<<'Wolfe City'<<'Arlington'<<'Aledo'<<'Alvarado'<<'Azle'<<'Bedford'<<'Boyd'<<'Burleson'<<'Cleburne'<<'Colleyville'<<'Crowley'<<'Euless'<<'Forreston'<<'Godley'<<'Grandview'<<'Grapevine'<<'Haslet'<<'Hurst'<<'Joshua'<<'Keene'<<'Kennedale'<<'Lillian'<<'Mansfield'<<'Maypearl'<<'Midlothian'<<'Millsap'<<'Newark'<<'Paradise'<<'Rhome'<<'Springtown'<<'Venus'<<'Weatherford'<<'Southlake'<<'Rio Vista'<<'Fort Worth'<<'Haltom City'<<'Naval Air Station/ Jrb'<<'North Richland Hills'<<'Denton'<<'Alvord'<<'Argyle'<<'Aubrey'<<'Decatur'<<'Keller'<<'Justin'<<'Krum'<<'Pilot Point'<<'Ponder'<<'Roanoke'<<'Sanger'<<'Bridgeport'<<'Chico'<<'Poolville'<<'Whitt'<<'Avalon'<<'Italy'<<'Milford'

    @start_date=params[:start_date]
    @end_date=params[:end_date]
    @area=params[:area]
    if(@area.size == 7)
      @visitors = Visitor.where(:created_at => @start_date..@end_date)
    else
      if(@area.include?('bcs'))
        @area << 'College Station' << 'Bryan'
      end
      if(@area.include?('df'))
        @area.delete('df')
        # @area <<'Addison'<<'Allen'<<'Carrollton'<<'Celina'<<'Coppell'<<'Flower Mound'<<'Plano'<<'Rockwall'<<'Frisco'<<'Irving'<<'Garland'<<'Sachse'<<'Grand Prairie'<<'The Colony'<<'Lewisville'<<'Lake Dallas'<<'Little Elm'<<'Mckinney'<<'Prosper'<<'Richardson'<<'Rowlett'<<'Wylie'<<'Bardwell'<<'Cedar Hill'<<'Crandall'<<'Desoto'<<'Duncanville'<<'Ennis'<<'Ferris'<<'Forney'<<'Fate'<<'Lancaster'<<'Caddo Mills'<<'Hutchins'<<'Kaufman'<<'Mabank'<<'Mesquite'<<'Palmer'<<'Red Oak'<<'Rosser'<<'Scurry'<<'Seagoville'<<'Terrell'<<'Josephine'<<'Waxahachie'<<'Lavon'<<'Wilmer'<<'Nevada'<<'Sunnyvale'<<'Royse City'<<'Dallas'<<'Greenville'<<'Princeton'<<'Anna'<<'Ben Franklin'<<'Campbell'<<'Celeste'<<'Blue Ridge'<<'Commerce'<<'Cooper'<<'Enloe'<<'Farmersville'<<'Klondike'<<'Lake Creek'<<'Lone Oak'<<'Melissa'<<'Pecan Gap'<<'Quinlan'<<'Wolfe City'<<'Arlington'<<'Aledo'<<'Alvarado'<<'Azle'<<'Bedford'<<'Boyd'<<'Burleson'<<'Cleburne'<<'Colleyville'<<'Crowley'<<'Euless'<<'Forreston'<<'Godley'<<'Grandview'<<'Grapevine'<<'Haslet'<<'Hurst'<<'Joshua'<<'Keene'<<'Kennedale'<<'Lillian'<<'Mansfield'<<'Maypearl'<<'Midlothian'<<'Millsap'<<'Newark'<<'Paradise'<<'Rhome'<<'Springtown'<<'Venus'<<'Weatherford'<<'Southlake'<<'Rio Vista'<<'Fort Worth'<<'Haltom City'<<'Naval Air Station/ Jrb'<<'North Richland Hills'<<'Denton'<<'Alvord'<<'Argyle'<<'Aubrey'<<'Decatur'<<'Keller'<<'Justin'<<'Krum'<<'Pilot Point'<<'Ponder'<<'Roanoke'<<'Sanger'<<'Bridgeport'<<'Chico'<<'Poolville'<<'Whitt'<<'Avalon'<<'Italy'<<'Milford'
        @area << @df
      end
      if(@area.include?('ocit'))
        @area.delete('ocit')
        # @temp = Array.new
        # @temp << @df
        @temp = @df
        @temp << 'Austin' << 'College Station' << 'San Antonio' << 'Bryan'
        # @other = TexasZipcode.select(:city).not(:city => @temp).uniq
        @other = TexasZipcode.uniq.pluck(:city)
        @other = @other - @temp
        @area << @other
      end
      if(@area.include?('oos'))
        @osc = Zipcode.uniq.pluck(:city)
        @other = TexasZipcode.uniq.pluck(:city)
        @other << 'N/A'
        @area << (@osc - @other)
      end
      @zipcodes = Zipcode.where(:city => @area)
      @visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @zipcodes)
    end

    render :partial => 'visitors/filter_area', :content_type => 'text/html'
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
