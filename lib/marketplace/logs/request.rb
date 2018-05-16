require "rest-client"
require "marketplace/constants"
require "marketplace/exceptions"

module Marketplace
  module Logs
    module Request
      def log_request(payload)
        payload = { request_log: payload }
        RestClient.post("#{HOST}/request_log", payload, @headers)
      rescue RestClient::ExceptionWithResponse => e
        raise Error.new(e.message, e.http_code)
      end
    end
  end
end
