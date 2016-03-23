require 'bitbucket2/model'
require 'bitbucket2/user'
require 'bitbucket2/participant'

module Bitbucket2
  class PullRequest
    include Model

    attribute :id, String
    attribute :description, String
    attribute :created_on, DateTime
    attribute :author, User
    attribute :reviewers, [User]
    attribute :participants, [Participant]
  end
end
