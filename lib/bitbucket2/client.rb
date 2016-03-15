require 'bitbucket2/commit'
require 'bitbucket2/repository'
require 'bitbucket2/pull_request'

require 'restroom'

require 'byebug'


module Bitbucket2
  class Client
    include Restroom

    def initialize oauth_token: nil
      @@oauth_token = oauth_token
    end

    def self.token_callable
      @@oauth_token
    end

    def self.stack(config)
      config.request :oauth2, token_callable
      #config.response :logger
    end


    restroom 'https://api.bitbucket.org', base_path: '2.0' do
      response_filter Proc.new { |response| response['values'] }

      exposes :repositories, model: Repository, id: :full_name do
        exposes :pull_requests, resource: 'pullrequests', model: PullRequest do
          exposes :commits, model: Commit, id: :hash
        end
        exposes :commits, model: Commit, id: :hash
      end
    end.dump
  end
end
