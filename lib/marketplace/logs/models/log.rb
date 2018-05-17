require 'json'

module Marketplace
  module Logs
    module Models
      class Log
        attr_accessor :concierge_user_id, :service_name, :request

        def initialize(concierge_user_id, service_name, request)
          raise ArgumentError, 'request must be a hash' unless request.is_a? Hash

          @concierge_user_id = concierge_user_id
          @service_name = service_name
          @request = request
        end

        def to_hash
          {
            concierge_user_id: @concierge_user_id,
            service_name: @service_name,
            request: @request.to_json
          }
        end

        def to_json
          to_hash.to_json
        end
      end
    end
  end
end
