class VisitorsController < ApplicationController
  require 'csv'
  before_action :set_visitor, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user

  def index
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @contactable = params[:contactable]

    if(@start_date.blank? || @end_date.blank?)
      @end_date = DateTime.now.at_end_of_day
      @start_date = (DateTime.now - 365.days)
      @start_date = @start_date.at_end_of_day
    else
      @start_date = DateTime.strptime(@start_date,'%m/%d/%Y').at_beginning_of_day
      @end_date = DateTime.strptime(@end_date,'%m/%d/%Y').at_end_of_day
    end
    if(@contactable == "1")
      @visitors = Visitor.where(:created_at => @start_date..@end_date).where(:contact => true)
    else
      @visitors = Visitor.where(:created_at => @start_date..@end_date)
    end

    render :layout => 'admin'

  end

  def filter_area
    @start_date=params[:start_date]
    @start_date = DateTime.strptime(@start_date,'%m/%d/%Y').at_beginning_of_day
    @end_date=params[:end_date]
    @end_date = DateTime.strptime(@end_date,'%m/%d/%Y').at_end_of_day

    @area=params[:area]
    @contactable=params[:contactable]

    # begin of "This part is not optimized and can be improved"

    if(@area.size == 7 || @area.size == 0)
      # @visitors = Visitor.where(:created_at => @start_date..@end_date)
      if(@contactable == '1')
        @visitors = Visitor.where(:created_at => @start_date..@end_date).where(:contact => true)
      else
        @visitors = Visitor.where(:created_at => @start_date..@end_date)
      end
    else
      @visitors = []
      if(@area.include?('Austin'))
        @visitors += Visitor.where(:created_at => @start_date..@end_date).
            where(:zip_code => FilteredZipcode.where(:area => 'Austin').
                uniq.pluck(:zip_code))
      end
      if(@area.include?('Houston'))
        @visitors += Visitor.where(:created_at => @start_date..@end_date).
            where(:zip_code => FilteredZipcode.where(:area => 'Houston').
                uniq.pluck(:zip_code))
      end
      if(@area.include?('San Antonio'))
        @visitors += Visitor.where(:created_at => @start_date..@end_date).
            where(:zip_code => FilteredZipcode.where(:area => 'San Antonio').
                uniq.pluck(:zip_code))
      end
      if(@area.include?('bcs'))
        @visitors += Visitor.where(:created_at => @start_date..@end_date).
            where(:zip_code => FilteredZipcode.where(:area => 'College Station').
            uniq.pluck(:zip_code))
      end
      if(@area.include?('df'))
        @visitors += Visitor.where(:created_at => @start_date..@end_date).
            where(:zip_code => FilteredZipcode.where(:area => 'Dallas/Fort Worth').
                uniq.pluck(:zip_code))
      end
      if(@area.include?('ocit'))
        @visitors += Visitor.where(:created_at => @start_date..@end_date).
            where(:zip_code => TexasZipcode.uniq.pluck(:zip_code)).
            where.not(:zip_code => FilteredZipcode.uniq.pluck(:zip_code))
      end
      if(@area.include?('oos'))
        @visitors += Visitor.where(:created_at => @start_date..@end_date).
            where.not(:zip_code => (TexasZipcode.uniq.pluck(:zip_code) << '00000'))
      end
      if(@area.include?('N/A'))
        @visitors += Visitor.where(:created_at => @start_date..@end_date).
            where(:zip_code => ['00000'])
      end

      if(@contactable == '1')
        @visitors = @visitors.select{|visitor| visitor.contact == true}
      end

    end

    render :partial => 'visitors/filter_area', :content_type => 'text/html'


  end

  # def filter_area
  #   @df = Array.new
  #   @df <<'Addison'<<'Allen'<<'Carrollton'<<'Celina'<<'Coppell'<<'Flower Mound'<<'Plano'<<
  #       'Rockwall'<<'Frisco'<<'Irving'<<'Garland'<<'Sachse'<<'Grand Prairie'<<'The Colony'<<
  #       'Lewisville'<<'Lake Dallas'<<'Little Elm'<<'Mckinney'<<'Prosper'<<'Richardson'<<'Rowlett'<<
  #       'Wylie'<<'Bardwell'<<'Cedar Hill'<<'Crandall'<<'Desoto'<<'Duncanville'<<'Ennis'<<'Ferris'<<
  #       'Forney'<<'Fate'<<'Lancaster'<<'Caddo Mills'<<'Hutchins'<<'Kaufman'<<'Mabank'<<'Mesquite'<<
  #       'Palmer'<<'Red Oak'<<'Rosser'<<'Scurry'<<'Seagoville'<<'Terrell'<<'Josephine'<<'Waxahachie'<<
  #       'Lavon'<<'Wilmer'<<'Nevada'<<'Sunnyvale'<<'Royse City'<<'Dallas'<<'Greenville'<<'Princeton'<<
  #       'Anna'<<'Ben Franklin'<<'Campbell'<<'Celeste'<<'Blue Ridge'<<'Commerce'<<'Cooper'<<'Enloe'<<
  #       'Farmersville'<<'Klondike'<<'Lake Creek'<<'Lone Oak'<<'Melissa'<<'Pecan Gap'<<'Quinlan'<<
  #       'Wolfe City'<<'Arlington'<<'Aledo'<<'Alvarado'<<'Azle'<<'Bedford'<<'Boyd'<<'Burleson'<<
  #       'Cleburne'<<'Colleyville'<<'Crowley'<<'Euless'<<'Forreston'<<'Godley'<<'Grandview'<<
  #       'Grapevine'<<'Haslet'<<'Hurst'<<'Joshua'<<'Keene'<<'Kennedale'<<'Lillian'<<'Mansfield'<<
  #       'Maypearl'<<'Midlothian'<<'Millsap'<<'Newark'<<'Paradise'<<'Rhome'<<'Springtown'<<'Venus'<<
  #       'Weatherford'<<'Southlake'<<'Rio Vista'<<'Fort Worth'<<'Haltom City'<<'Naval Air Station/ Jrb'<<
  #       'North Richland Hills'<<'Denton'<<'Alvord'<<'Argyle'<<'Aubrey'<<'Decatur'<<'Keller'<<'Justin'<<
  #       'Krum'<<'Pilot Point'<<'Ponder'<<'Roanoke'<<'Sanger'<<'Bridgeport'<<'Chico'<<'Poolville'<<
  #       'Whitt'<<'Avalon'<<'Italy'<<'Milford'
  #
  #   @start_date=params[:start_date]
  #   @start_date = DateTime.strptime(@start_date,'%m/%d/%Y').at_beginning_of_day
  #   @end_date=params[:end_date]
  #   @end_date = DateTime.strptime(@end_date,'%m/%d/%Y').at_end_of_day
  #
  #   @area=params[:area]
  #   @contactable=params[:contactable]
  #
  #   # begin of "This part is not optimized and can be improved"
  #
  #   if(@area.size == 7 || @area.size == 0)
  #     # @visitors = Visitor.where(:created_at => @start_date..@end_date)
  #     if(@contactable == "1")
  #       @visitors = Visitor.where(:created_at => @start_date..@end_date).where(:contact => true)
  #     else
  #       @visitors = Visitor.where(:created_at => @start_date..@end_date)
  #     end
  #   else
  #     if(@area.include?('bcs'))
  #       @area << 'College Station' << 'Bryan'
  #     end
  #     if(@area.include?('df'))
  #       # @area.delete('df')
  #       @area = @area - ['df']
  #       @area << @df
  #     end
  #     if(@area.include?('ocit'))
  #       # @area.delete('ocit')
  #       @area = @area - ['ocit']
  #       @temp = @df
  #       @temp << 'Austin' << 'College Station' << 'San Antonio' << 'Bryan' << 'Houston'
  #       @other = TexasZipcode.uniq.pluck(:city)
  #       @other = @other - @temp
  #       @area << @other
  #     end
  #     if(@area.include?('oos'))
  #       @osc = Zipcode.uniq.pluck(:city)
  #       @other = TexasZipcode.uniq.pluck(:city)
  #       @other << 'N/A'
  #       @area << (@osc - @other)
  #     end
  #     @zipcodes = Zipcode.where(:city => @area)
  #     # @visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @zipcodes)
  #     if(@contactable == "1")
  #       @visitors = Visitor.where(:created_at => @start_date..@end_date).where(:contact => true).where(:zip_code => @zipcodes)
  #     else
  #       @visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @zipcodes)
  #     end
  #
  #     # end of "This part is not optimized and can be improved"
  #   end
  #
  #   render :partial => 'visitors/filter_area', :content_type => 'text/html'
  #
  #
  # end



  # GET /visitors/1
  # GET /visitors/1.json
  def show
    @n_questions = Question.all #number of questions in the database

    render :partial => 'visitors/show', :content_type => 'text/html'
  end

  # GET /visitors/new
  def new
    @visitor = Visitor.new
  end

  # GET /visitors/1/edit
  def edit
    render :layout => 'admin'
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

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
