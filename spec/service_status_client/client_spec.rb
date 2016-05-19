require 'spec_helper'

module ServiceStatusClient
  describe Client do

    describe '#initialize' do
      context 'When authentication token exists' do
        let(:subject) { ServiceStatusClient::Client.new(auth_token: 'XYZ') }

        it 'creates a new Client object' do
          expect(subject).to be_kind_of(ServiceStatusClient::Client)
        end
      end

      context 'When authentication token is missing' do
        it 'raises an ArgumentError' do
          expect{ ServiceStatusClient::Client.new }.to raise_error(ArgumentError)
        end
      end

      context 'When url is missing' do
        let(:subject) { ServiceStatusClient::Client.new(auth_token: 'XYZ') }
        let(:default_url) { 'http://localhost:3000/api/v1' }

        it 'assigns the default url' do
          expect(subject.url).to eq(default_url)
        end
      end

      context 'When url is present' do
        let(:url) { 'http://servicestatus.com/api/v1' }
        let(:subject) { ServiceStatusClient::Client.new(url: url, auth_token: 'XYZ') }

        it 'assigns the url sent' do
          expect(subject.url).to eq(url)
        end
      end
    end

    describe '#current_status' do
      context 'When current status exists' do
        before do
          @current_status = '{"id"=>4, "status"=>"UP", "message"=>"Everything is fine", "created_at"=>"2016-05-19T21:27:01.753Z", "updated_at"=>"2016-05-19T21:27:01.753Z"}'
          stub_request(:get, 'http://servicestatus.com/api/v1/status_messages/current').to_return(:body => @current_status, :status => 201, :headers => {})
        end

        it 'returns the service current status' do
          client = ServiceStatusClient::Client.new(auth_token: 'XYZ')
          response = client.current_status

          expect(@current_status).to eq response
        end
      end

      context 'When current status does not exists' do
        it 'raises a ResourceNotFound Exception' do
          client = ServiceStatusClient::Client.new(auth_token: 'XYZ')
          expect{ ServiceStatusClient::Client}
        end
      end
    end
  end
end
