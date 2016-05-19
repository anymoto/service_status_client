module ServiceStatusClient
  class Client
    attr_accessor :auth_token, :url

    def initialize(options = {})
      @auth_token = options[:auth_token]
      @url = options[:url]

      ServiceStatusClient::Base.site = url
      self.token = auth_token
    end

    def self.resources
      @resources ||= []
    end

    def self.token=(value)
      resources.each do |klass|
        klass.headers['Authorization'] = "Token token=#{ value }"
      end
    end
  end
end
