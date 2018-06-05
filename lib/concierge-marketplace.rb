require "marketplace/version"
require "marketplace/client"
require "marketplace/logs/models/log"
require "marketplace/logs/models/order_log"

module Marketplace
  def self.logger
    @@logger ||= defined?(Rails) ? Rails.logger : Logger.new(STDOUT)
  end

  def self.logger=(logger)
    @@logger = logger
  end
end
