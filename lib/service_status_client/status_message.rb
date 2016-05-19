require 'pry'

module ServiceStatusClient
  class StatusMessage < Base
    self.site = 'http://localhost:3000/api/v1'

    class << self
      attr_accessor :url, :auth_token

      def setup(options = {})
        @url = options[:url]
        @auth_token = options[:auth_token]
      end

      def current
        begin
          self.get(:current)
        rescue
          raise ServiceStatusClient::Exceptions::ResourceNotFoundException
        end
      end

      def auth_token=(value)
        @auth_token = value
        self.headers['Authorization'] = "Token token=#{ value }"
      end

      def url=(value)
        @url = value
        self.site = value
      end
    end
  end
end
