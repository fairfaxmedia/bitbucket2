require 'virtus'

module Bitbucket2
  class Commit
    include Virtus.model

    attribute :hash, String
  end
end
