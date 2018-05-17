require "marketplace/constants"
require "marketplace/logs/request"
require "marketplace/logs/order"
require "base64"

module Marketplace
  class Client
    include Marketplace::Logs::Request
    include Marketplace::Logs::Order

    def initialize(cred)
      @headers = {
        "Authorization" => "Basic #{Base64.encode64(cred)}"
      }
    end
  end
end
