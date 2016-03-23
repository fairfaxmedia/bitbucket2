require 'spec_helper'


def dump data
  JSON.dump(values: data)
end

module Bitbucket2

  repository_data = [
    { full_name: 'all/knowledge' }
  ]

  describe Client do
    subject { described_class.new }

    context 'repositories' do

      before do
        stub_request(:get, "https://api.bitbucket.org/2.0/repositories").
          with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.2'}).
          to_return(:status => 200, :body => dump(repository_data), :headers => {})
      end

      it 'can all be collected' do
        expect(subject.repositories.all).to all( be_a Repository )
        expect(subject.repositories.all.map(&:full_name)).to eq ['all/knowledge']
      end
    end
  end
end
