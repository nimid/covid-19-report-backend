# Department of Disease Control (DDC)
module DDC
  class Client
    TIMEOUT = 5
    URL = 'https://covid19.th-stat.com/api/open/today'.freeze

    # @return DDC::Responses::Today
    def self.today
      begin
        raw_response = RestClient::Request.execute(method: :get, url: URL, timeout: TIMEOUT)
      rescue RestClient::Exceptions::Timeout
        raise DDC::Errors::TimeoutError, "request timeout, current timeout is #{TIMEOUT}"
      end

      response = parse(raw_response)

      DDC::Responses::Today.new(
        confirmed: response['Confirmed'],
        recovered: response['Recovered'],
        hospitalized: response['Hospitalized'],
        deaths: response['Deaths'],
        new_confirmed: response['NewConfirmed'],
        new_recovered: response['NewRecovered'],
        new_hospitalized: response['NewHospitalized'],
        new_deaths: response['NewDeaths'],
        update_date: response['UpdateDate']
      )
    end

    private_class_method def self.parse(raw_response)
      raise DDC::Errors::ParseResponseError, 'raw response is nil' if raw_response.nil?

      raw_response_body = raw_response.body

      begin
        JSON.parse(raw_response_body)
      rescue JSON::ParserError
        raise DDC::Errors::ParseResponseError,
              "parsing error, raw response is #{raw_response_body.truncate(500)}"
      end
    end
  end
end
