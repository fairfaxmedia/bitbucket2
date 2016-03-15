require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'yaml'
require 'oauth2'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec


def defaults_path
  File.expand_path('../defaults.yml', __FILE__)
end

def defaults
  File.exists?(defaults_path) ? YAML.load_file(defaults_path) : {}
end

def credentials
  defaults['credentials']
end

def configure
  Bitbucket2.configure do |config|
    config.oauth2_config = credentials
  end
end

def client
  OAuth2::Client.new(credentials['key'], credentials['secret'],
    site: 'https://bitbucket.org',
    authorize_url: '/site/oauth2/authorize',
    token_url: '/site/oauth2/access_token'
  )
end

def token
  OAuth2::AccessToken.from_hash(client, defaults['token']).refresh!.token
end


task :console do
  require 'irb'
  require 'irb/completion'
  require 'bitbucket2'

  configure

  Bitbucket2.define_singleton_method(:default_client) {
    Bitbucket2::Client.new(oauth_token: token)
  }

  ARGV.clear
  IRB.start
end

task :oauth do
  puts "\nFollow this link: " + client.auth_code.authorize_url(:redirect_uri => 'http://localhost:8080/oauth2/callback')

  puts "\nEnter the URL you were redirected to (it should have a 'code' parameter in it):"
  url = STDIN.gets.strip

  require 'uri'
  require 'cgi'

  begin
    code = CGI.parse(URI(url).query)['code'].first
    token = client.auth_code.get_token(code, :redirect_uri => 'http://localhost:8080/oauth2/callback')

    str = YAML.dump(defaults.merge('token' => token.to_hash))
    File.open(defaults_path, 'wb') { |f| f.write str }
  rescue StandardError => e
    puts e
  end


end
