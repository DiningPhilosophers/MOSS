class VisitorsStatisticsController < ApplicationController
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
    @total_visitors = Visitor.where(:created_at => @start_date..@end_date).size;
  end
end
