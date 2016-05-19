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
    end
  end
end
