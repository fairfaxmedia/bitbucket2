require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec


desc "Console task for quick setup"
task :console do
  require 'irb'
  require 'irb/completion'
  require 'bitbucket2'

  begin
    require 'oauth2_rake'
  rescue LoadError
  end

  if defined? Oauth2Rake
    defaults = Oauth2Rake::Configuration.new(
      path: File.expand_path('defaults.yml', Dir.getwd),
      site: 'https://bitbucket.org',
      authorize_url: '/site/oauth2/authorize',
      token_url: '/site/oauth2/access_token'
    )
    Bitbucket2.configure { |config| config.oauth2_config = defaults.credentials }

    Bitbucket2.define_singleton_method(:default_client) {
      Bitbucket2::Client.new(oauth_token: defaults.refreshed_token)
    }
  end

  ARGV.clear
  IRB.start
end
