require 'bitbucket2/model'
require 'bitbucket2/user'

module Bitbucket2
  class Author
    include Model

    attribute :raw, String
    attribute :user, User
  end
end
