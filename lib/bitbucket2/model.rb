require 'virtus'
require 'active_model'

module Bitbucket2
  module Model
    def self.included(base)
      base.include Virtus.model
      base.include ActiveModel::Serializers::JSON
    end
  end
end
