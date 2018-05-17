require "rest-client"
require "marketplace/constants"
require "marketplace/exceptions"
require "json"

module Marketplace
  module Logs
    module Order
      def log_order(payload)
        payload = { order: payload }
        res = RestClient.post("#{HOST}/order_log", payload, @headers)
        body = JSON.parse(res)
        body["id"]
      rescue RestClient::ExceptionWithResponse => e
        raise Error.new(e.message, e.http_code)
      rescue StandardError => e
        raise Error.new(e.message, 500)
      end
    end
  end
end
