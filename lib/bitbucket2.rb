require "bitbucket2/version"
require 'bitbucket2/client'


module Bitbucket2
  def self.configure
    yield @configuration ||= Configuration.new
  end

  class Configuration
    attr_accessor :oauth2_config
  end
end
