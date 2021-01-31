module DDC
  module Responses
    class Today
      attr_accessor :confirmed,
                    :recovered,
                    :hospitalized,
                    :deaths,
                    :new_confirmed,
                    :new_recovered,
                    :new_hospitalized,
                    :new_deaths,
                    :update_date

      def initialize(params = {})
        params.each { |key, value| send "#{key}=", value }
      end
    end
  end
end
