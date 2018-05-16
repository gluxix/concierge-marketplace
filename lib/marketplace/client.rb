require "marketplace/constants"
require "marketplace/logs/request"
require "base64"

module Marketplace
  class Client
    include Marketplace::Logs::Request

    def initialize(cred)
      @headers = {
        "Authorization" => "Basic #{Base64.encode64(cred)}"
      }
    end

    def hi
      'HI'
    end
  end
end
