require 'bitbucket2/model'

module Bitbucket2
  class User
    include Model

    attribute :username, String
    attribute :display_name, String
  end
end
