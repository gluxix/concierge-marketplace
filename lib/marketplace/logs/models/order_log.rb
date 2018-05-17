require 'marketplace/logs/models/log'

module Marketplace
  module Logs
    module Models
      class OrderLog < Log
        attr_accessor :status

        def initialize(concierge_user_id, service_name, request, status)
          super(concierge_user_id, service_name, request)
          @status = status
        end

        def to_hash
          hash = super
          hash[:status] = @status
          hash
        end
      end
    end
  end
end
