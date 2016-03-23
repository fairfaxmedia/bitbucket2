require "bundler/gem_tasks"
require "rspec/core/rake_task"

begin
  require 'oauth2_rake'
rescue LoadError
end

RSpec::Core::RakeTask.new(:spec)

task :default => :spec


desc "Console task for quick setup"
task :console do
  require 'irb'
  require 'irb/completion'
  require 'bitbucket2'

  if defined? Oauth2Rake
    defaults = Oauth2Rake::Configuration.new(
      path: File.expand_path('defaults.yml', Dir.getwd),
      site: 'https://bitbucket.org',
      authorize_url: '/site/oauth2/authorize',
      token_url: '/site/oauth2/access_token'
    )

    Bitbucket2.configure do |config|
      config.stack = -> (faraday) {
        #faraday.use :http_cache, store: cache_store
        faraday.request :oauth2, defaults.refreshed_token
        faraday.response :logger
      }
    end
  end

  ARGV.clear
  IRB.start
end
