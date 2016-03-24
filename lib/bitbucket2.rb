require "bitbucket2/version"
require 'bitbucket2/client'


module Bitbucket2
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield self.configuration
  end

  class Configuration
    attr_accessor :stack
  end
end
