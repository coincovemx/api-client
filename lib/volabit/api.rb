
require_relative 'api/rates'
require_relative 'api/account'

module Volabit
  module API
    include Rates
    include Account

    private

    # Request a resource using the GET method.
    def get_resource(resource, params = nil)
      @token.refresh if @token.expired?
      @token.get(resource, params: params)
    end

    def post_to_resource(resource, params)
      @token.refresh if @token.expired?
      @token.post(resource, params: params)
    end

    def delete_resource(resource)
      @token.refresh if @token.expired?
      @token.delete(resource)
    end
  end
end
