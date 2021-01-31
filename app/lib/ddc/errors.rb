module DDC
  module Errors
    class ParseResponseError < StandardError; end

    class TimeoutError < StandardError; end
  end
end
