require 'virtus'

module Bitbucket2
  class PullRequest
    include Virtus.model

    attribute :id, String
    attribute :description, String

  end
end
