class VisitsController < ApplicationController
  before_action :authenticate

  def index
    @visits = Visit.order(:arrival_time)
    respond_to do |format|
      format.html
      format.csv { send_data @visits.to_csv }
      # format.xls # { send_data @visits.to_csv(col_sep: "\t") }
    end
  end

  def import
    Visit.import(params[:file])
    redirect_to visits_path
  end

  # def new
  #   @visit = Visit.new
  # end

end
