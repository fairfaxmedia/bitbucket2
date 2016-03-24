require 'bitbucket2/commit'
require 'bitbucket2/repository'
require 'bitbucket2/pull_request'
require 'restroom'


module Bitbucket2
  class Client
    include Restroom

    def initialize
    end

    def self.stack(config)
      Bitbucket2.configuration.stack.call(config) if Bitbucket2.configuration.stack
    end


    restroom 'https://api.bitbucket.org', base_path: '2.0' do

      response_filter lambda {|mode, response|
        return response unless mode == :plural

        begin
          response.fetch('values')
        rescue KeyError
          raise Restroom::DataError, "Weird response: #{response[0..100]}"
        end
      }

      exposes :repositories, model: Repository, id: :full_name do
        exposes :pull_requests, resource: 'pullrequests', model: PullRequest do
          exposes :commits, model: Commit, id: :hash
        end
        exposes :commits, model: Commit, id: :hash
        exposes :commit, model: Commit, id: :hash
      end
    end.dump
  end
end
