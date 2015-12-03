class VisitorsStatisticsController < ApplicationController
  before_action :logged_in_user

  def show
    @start_date = params[:start_date]
    @end_date = params[:end_date]

    if(@start_date.blank? || @end_date.blank?)
      @end_date = DateTime.now.at_end_of_day
      @start_date = (DateTime.now - 365.days)
      @start_date = @start_date.at_end_of_day
    else
      @start_date = DateTime.strptime(@start_date,'%m/%d/%Y').at_beginning_of_day
      @end_date = DateTime.strptime(@end_date,'%m/%d/%Y').at_end_of_day
    end

    # @total_visitors = Visitor.where(:created_at => @start_date..@end_date).size
    @total_visitors = Group.where(:created_at => @start_date..@end_date)
    if(@total_visitors.size == 0)
      @total_v = 0
    else
      # @total_group_ids = @total_visitors.uniq.pluck(:group_id)
      @total_groups = @total_visitors.pluck(:group_size)
      @total_v = @total_groups.sum()
    end

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
    # @n_df_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @df_zipcodes).size
    @n_df_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @df_zipcodes)
    if(@n_df_visitors.size == 0)
      @df_v = 0
    else
      @df_group_ids = @n_df_visitors.uniq.pluck(:group_id)
      @df_groups = Group.where(:id => @df_group_ids).pluck(:group_size)
      @df_v = @df_groups.sum()
    end

    @austin_zipcodes = Zipcode.where(:city => 'Austin')
    # @n_austin_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @austin_zipcodes).size
    @n_austin_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @austin_zipcodes)
    if(@n_austin_visitors.size == 0)
      @austin_v = 0
    else
      @austin_group_ids = @n_austin_visitors.uniq.pluck(:group_id)
      @austin_groups = Group.where(:id => @austin_group_ids).pluck(:group_size)
      @austin_v = @austin_groups.sum()
    end

    @temp = @df
    @temp << 'Austin' << 'College Station' << 'San Antonio' << 'Bryan' << 'Houston'
    @other = TexasZipcode.uniq.pluck(:city)
    @other = @other - @temp
    @ocit_zipcodes = Zipcode.where(:city => @other)
    # @n_ocit_visitors =  Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @ocit_zipcodes).size
    @n_ocit_visitors =  Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @ocit_zipcodes)
    if(@n_ocit_visitors.size == 0)
      @ocit_v = 0
    else
      @ocit_group_ids = @n_ocit_visitors.uniq.pluck(:group_id)
      @ocit_groups = Group.where(:id => @ocit_group_ids).pluck(:group_size)
      @ocit_v = @ocit_groups.sum()
    end

    # @n_ooc_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => '00000').size
    @n_ooc_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => '00000')
    if(@n_ooc_visitors.size == 0)
      @ooc_v = 0
    else
      @ooc_group_ids = @n_ooc_visitors.uniq.pluck(:group_id)
      @ooc_groups = Group.where(:id => @ooc_group_ids).pluck(:group_size)
      @ooc_v = @ooc_groups.sum()
    end

    @bcs_zipcodes = Zipcode.where(:city => ['Bryan','College Station'])
    # @n_bcs_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @bcs_zipcodes).size
    @n_bcs_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @bcs_zipcodes)
    if(@n_bcs_visitors.size == 0)
      @bcs_v = 0
    else
      @bcs_group_ids = @n_bcs_visitors.uniq.pluck(:group_id)
      @bcs_groups = Group.where(:id => @bcs_group_ids).pluck(:group_size)
      @bcs_v = @bcs_groups.sum()
    end

    @texas_zipcodes = TexasZipcode.uniq.pluck(:zip_code)
    @texas_zipcodes << '00000'
    # @n_os_visitors = Visitor.where(:created_at => @start_date..@end_date).where.not(:zip_code => @texas_zipcodes).size
    @n_os_visitors = Visitor.where(:created_at => @start_date..@end_date).where.not(:zip_code => @texas_zipcodes)
    if(@n_os_visitors.size == 0)
      @os_v = 0
    else
      @os_group_ids = @n_os_visitors.uniq.pluck(:group_id)
      @os_groups = Group.where(:id => @os_group_ids).pluck(:group_size)
      @os_v = @os_groups.sum()
    end

    @sanantonio_zipcodes = TexasZipcode.where(:city => 'San Antonio').uniq.pluck(:zip_code)
    # @n_sa_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @sanantonio_zipcodes).size
    @n_sa_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @sanantonio_zipcodes)
    if(@n_sa_visitors.size == 0)
      @sa_v = 0
    else
      @sa_group_ids = @n_sa_visitors.uniq.pluck(:group_id)
      @sa_groups = Group.where(:id => @sa_group_ids).pluck(:group_size)
      @sa_v = @sa_groups.sum()
    end

    @houston_zipcodes = TexasZipcode.where(:city => 'Houston').uniq.pluck(:zip_code)
    # @n_h_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @houston_zipcodes).size
    @n_h_visitors = Visitor.where(:created_at => @start_date..@end_date).where(:zip_code => @houston_zipcodes)
    if(@n_h_visitors.size == 0)
      @houston_v = 0
    else
      @houston_group_ids = @n_h_visitors.uniq.pluck(:group_id)
      @houston_groups = Group.where(:id => @houston_group_ids).pluck(:group_size)
      @houston_v = @houston_groups.sum()
    end

    render :layout => 'admin'
  end

  def charts
    render :layout => 'admin'
  end

  def chartkick_charts
    # @v = Group.where(Visitor.)
    render :layout => 'admin'
  end

  def visitors_in_date
    @dates_result = []
    @dates = params[:dates]

    # if @dates.size > 31
    #
    # else
      @dates.each do |date|
        @s = DateTime.strptime(date,'%m/%d/%Y').at_beginning_of_day
        @e = DateTime.strptime(date,'%m/%d/%Y').at_end_of_day
        # @dates_result.push(d:date,v:Visitor.where(:created_at => @s..@e).size)
        @dates_result.push(d:date,v:Group.where(:created_at => @s..@e).pluck(:group_size).sum())
      end
    # end

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
