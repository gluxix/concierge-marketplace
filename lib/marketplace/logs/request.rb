require "rest-client"
require "marketplace/constants"
require "marketplace/exceptions"
require "marketplace/logs/models/log"

module Marketplace
  module Logs
    module Request
      def log_request(payload)
        unless payload.is_a? Models::Log
          raise ArgumentError, 'payload must be a Marketplace::Logs::Models::Log'
        end
        payload = { request_log: payload.to_hash }
        RestClient.post("#{HOST}/request_log", payload, @headers)
      rescue RestClient::ExceptionWithResponse => e
        raise Error.new(e.message, e.http_code)
      end
    end
  end
end
