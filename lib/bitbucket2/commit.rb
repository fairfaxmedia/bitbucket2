require 'virtus'
require 'bitbucket2/author'
require 'bitbucket2/model'

module Bitbucket2
  class Commit
    include Model

    attribute :hash, String
    attribute :date, DateTime
    attribute :message, String
    attribute :author, Author
  end
end
