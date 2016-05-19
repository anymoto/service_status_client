require "service_status_client/version"

module ServiceStatusClient
  class << self
    attr_accessor :auth_token, :url

    def authenticate(url, auth_token)
      @url = url
      @auth_token = auth_token

      self::Base.site = url
      self.token = auth_token
    end

    def token=(value)
      resources.each do |klass|
        klass.headers['Authorization'] = "Token token=#{ value }"
      end
    end

    def resources
      @resources ||= []
    end
  end

  class Base < ActiveResource::Base
    self.format = :json

    def self.inherited(base)
      ServiceStatusClient.resources << base
      super
    end
  end

  class StatusMessage < Base
  end
end
