require "rest-client"
require "marketplace/constants"
require "marketplace/exceptions"
require "marketplace/logs/models/order_log"
require "json"

module Marketplace
  module Logs
    module Order
      def log_order(payload)
        unless payload.is_a? Models::OrderLog
          raise ArgumentError, 'payload must be a Marketplace::Logs::Models::OrderLog'
        end
        payload = { order: payload.to_hash }
        Marketplace.logger.debug "Sending #{payload}"
        res = RestClient.post("#{HOST}/order_log", payload, @headers)
        body = JSON.parse(res)
        body["id"]
      rescue RestClient::ExceptionWithResponse => e
        Marketplace.logger.error "concierge-marketplace ERROR while sending order log:"
        Marketplace.logger.error e.response
        raise Error.new(e.message, e.http_code)
      rescue StandardError => e
        Marketplace.logger.error e.inspect
        raise Error.new(e.message, 500)
      end
    end
  end
end
