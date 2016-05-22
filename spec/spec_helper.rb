$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'service_status_client'
require 'service_status_client/exceptions/resource_not_found_exception'
require 'service_status_client/exceptions/unprocessable_entity_exception'
require 'webmock/rspec'

WebMock.disable_net_connect!(:allow_localhost => true)
