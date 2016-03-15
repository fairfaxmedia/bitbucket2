require 'virtus'

module Bitbucket2
  class Repository
    include Virtus.model

    attribute :name, String
    attribute :full_name, String
  end
end
