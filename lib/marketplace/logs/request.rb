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
        Marketplace.logger.debug "Sending #{payload}"
        RestClient.post("#{HOST}/request_log", payload, @headers)
      rescue RestClient::ExceptionWithResponse => e
        Marketplace.logger.error "concierge-marketplace ERROR while sending request log:"
        Marketplace.logger.error e.response
        raise Error.new(e.message, e.http_code)
      end
    end
  end
end
