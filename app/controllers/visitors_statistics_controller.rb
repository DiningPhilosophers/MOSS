class VisitorsStatisticsController < ApplicationController
  before_action :logged_in_user

  def show
    @start_date = params[:start_date]
    @end_date = params[:end_date]

    if(@start_date.blank? || @end_date.blank?)
      @end_date = DateTime.now.at_end_of_day
      @start_date = (DateTime.now - 15.days)
      @start_date = @start_date.at_end_of_day
    else
      @start_date = DateTime.strptime(@start_date,'%m/%d/%Y').at_beginning_of_day
      @end_date = DateTime.strptime(@end_date,'%m/%d/%Y').at_end_of_day
    end

    @total_visitors = Visitor.where(:created_at => @start_date..@end_date).size

    @df = Array.new
    @df <<'Addison'<<'Allen'<<'Carrollton'<<'Celina'<<'Coppell'<<'Flower Mound'<<'Plano'<<
        'Rockwall'<<'Frisco'<<'Irving'<<'Garland'<<'Sachse'<<'Grand Prairie'<<'The Colony'<<
        'Lewisville'<<'Lake Dallas'<<'Little Elm'<<'Mckinney'<<'Prosper'<<'Richardson'<<'Rowlett'<<
        'Wylie'<<'Bardwell'<<'Cedar Hill'<<'Crandall'<<'Desoto'<<'Duncanville'<<'Ennis'<<'Ferris'<<
        'Forney'<<'Fate'<<'Lancaster'<<'Caddo Mills'<<'Hutchins'<<'Kaufman'<<'Mabank'<<'Mesquite'<<
        'Palmer'<<'Red Oak'<<'Rosser'<<'Scurry'<<'Seagoville'<<'Terrell'<<'Josephine'<<'Waxahachie'<<
        'Lavon'<<'Wilmer'<<'Nevada'<<'Sunnyvale'<<'Royse City'<<'Dallas'<<'Greenville'<<'Princeton'<<
        'Anna'<<'Ben Franklin'<<'Campbell'<<'Celeste'<<'Blue Ridge'<<'Commerce'<<'Cooper'<<'Enloe'<<
        'Farmersville'<<'Klondike'<<'Lake Creek'<<'Lone Oak'<<'Melissa'<<'Pecan Gap'<<'Quinlan'<<
        'Wolfe City'<<'Arlington'<<'Aledo'<<'Alvarado'<<'Azle'<<'Bedford'<<'Boyd'<<'Burleson'<<
        'Cleburne'<<'Colleyville'<<'Crowley'<<'Euless'<<'Forreston'<<'Godley'<<'Grandview'<<
        'Grapevine'<<'Haslet'<<'Hurst'<<'Joshua'<<'Keene'<<'Kennedale'<<'Lillian'<<'Mansfield'<<
        'Maypearl'<<'Midlothian'<<'Millsap'<<'Newark'<<'Paradise'<<'Rhome'<<'Springtown'<<'Venus'<<
        'Weatherford'<<'Southlake'<<'Rio Vista'<<'Fort Worth'<<'Haltom City'<<'Naval Air Station/ Jrb'<<
        'North Richland Hills'<<'Denton'<<'Alvord'<<'Argyle'<<'Aubrey'<<'Decatur'<<'Keller'<<'Justin'<<
        'Krum'<<'Pilot Point'<<'Ponder'<<'Roanoke'<<'Sanger'<<'Bridgeport'<<'Chico'<<'Poolville'<<
        'Whitt'<<'Avalon'<<'Italy'<<'Milford'

    @df_zipcodes = Zipcode.where(:city => @df)
    @n_df_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @df_zipcodes).size

    @austin_zipcodes = Zipcode.where(:city => 'Austin')
    @n_austin_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @austin_zipcodes).size

    @temp = @df
    @temp << 'Austin' << 'College Station' << 'San Antonio' << 'Bryan' << 'Houston'
    @other = TexasZipcode.uniq.pluck(:city)
    @other = @other - @temp
    @ocit_zipcodes = Zipcode.where(:city => @other)
    @n_ocit_visitors =  Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @ocit_zipcodes).size

    @n_ooc_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => '00000').size

    @bcs_zipcodes = Zipcode.where(:city => ['Bryan','College Station'])
    @n_bcs_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @bcs_zipcodes).size

    @texas_zipcodes = TexasZipcode.uniq.pluck(:zip_code)
    @texas_zipcodes << '00000'
    @n_os_visitors = Visitor.where(:created_at => @start_date..@end_date).where.not(:zip_code => @texas_zipcodes).size

    @sanantonio_zipcodes = TexasZipcode.where(:city => 'San Antonio').uniq.pluck(:zip_code)
    @n_sa_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @sanantonio_zipcodes).size

    @houston_zipcodes = TexasZipcode.where(:city => 'Houston').uniq.pluck(:zip_code)
    @n_h_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @houston_zipcodes).size

    render :layout => 'admin'
  end

  def charts
    render :layout => 'admin'
  end

  def visitors_in_date
    @dates_result = []
    @dates = params[:dates]
    @dates.each do |date|
      @s = DateTime.strptime(date,'%m/%d/%Y').at_beginning_of_day
      @e = DateTime.strptime(date,'%m/%d/%Y').at_end_of_day
      @dates_result.push(d:date,v:Visitor.where(:created_at => @s..@e).size)
    end

    # render :json => @dates
    render :json => @dates_result
  end

  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
