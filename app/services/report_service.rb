class ReportService
  def self.exists_by?(opts)
    Report.where(opts).count > 1
  end

  def self.expired?
    last_report = Report.last
    return true if last_report.nil?

    begin
      @today = DDC::Client.today
    rescue DDC::Errors::TimeoutError,
           DDC::Errors::ParseResponseError,
           StandardError => e
      Rails.logger.error("#{e.class}: #{e.message}")
      return false
    end

    last_report.updated_date < @today.update_date
  end

  def self.update
    begin
      @today ||= DDC::Client.today
    rescue DDC::Errors::TimeoutError,
           DDC::Errors::ParseResponseError,
           StandardError => e
      Rails.logger.error("#{e.class}: #{e.message}")
      return false
    end

    return true if exists_by?(updated_date: @today.update_date)

    report = Report.new(
      new_cases: @today.new_confirmed,
      new_recovered: @today.new_recovered,
      new_deaths: @today.new_deaths,
      total_cases: @today.confirmed,
      total_recovered: @today.recovered,
      total_deaths: @today.deaths,
      updated_date: @today.update_date
    )

    report.save
  end
end
