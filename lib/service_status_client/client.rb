module ServiceStatusClient
  class Client
    attr_accessor :url, :auth_token

    def initialize(options = {})
      @url = options[:url] || 'http://localhost:3000/api/v1'
      @auth_token = options[:auth_token]

      if auth_token.nil?
        raise ArgumentError, 'Authentication token is needed'
      end

      set_up_connection
    end

    def current_status
      begin
        ServiceStatusClient::StatusMessage.get(:current)
      rescue
        raise ServiceStatusClient::Exceptions::ResourceNotFoundException, 'Resource not found!'
      end
    end

    def create_status(options = {})
      begin
        ServiceStatusClient::StatusMessage.create(status: options[:status], message: options[:message])
      rescue
        raise ServiceStatusClient::Exceptions::UnprocessableEntityException, 'Unable to create the resource'
      end
    end

    protected

    def set_up_connection
      ServiceStatusClient::Base.site = url
      ServiceStatusClient::Base.headers['Authorization'] = "Token token=#{ auth_token }"
    end
  end
end
