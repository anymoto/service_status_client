require "service_status_client/version"
require 'active_resource'

module ServiceStatusClient
  class << self
    attr_accessor :token, :url

    def authenticate(url, token)
      @url = url
      @token = token
    end
  end

  class Base < ActiveResource::Base
  end

  class Status < Base
  end
end
