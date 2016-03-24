require 'bitbucket2/model'

module Bitbucket2
  class Participant
    include Model

    attribute :role, String
    attribute :user, User
    attribute :approved, Boolean
  end
end
