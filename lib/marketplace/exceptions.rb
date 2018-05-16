module Marketplace
  class Error < StandardError
    attr_reader :message, :status
    
    def initialize(message, status)
      @message, @status = message, status
    end
  end
end
