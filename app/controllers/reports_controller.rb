class ReportsController < ApplicationController
  def index
    ReportService.update if ReportService.expired?

    render json: serialize(Report.last)
  end
end
