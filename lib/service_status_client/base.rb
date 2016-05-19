module ServiceStatusClient
  class Base < ActiveResource::Base
    self.format = :json
  end
end
