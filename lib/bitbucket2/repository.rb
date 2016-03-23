require 'bitbucket2/model'

module Bitbucket2
  class Repository
    include Model

    attribute :name, String
    attribute :full_name, String
  end
end
