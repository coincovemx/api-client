
require_relative 'api/rates'
require_relative 'api/users'
require_relative 'api/slips'
require_relative 'api/transactions'

module Volabit
  module API
    private

    # Request a resource using the GET method.
    def get_resource(resource, params = nil)
      @token.refresh if @token.expired?
      response = @token.get(resource, params: params)
      JSON.parse response.body, :symbolize_names => true
    end

    def post_to_resource(resource, params)
      @token.refresh if @token.expired?
      response = @token.post(resource, params: params)
      JSON.parse response.body, :symbolize_names => true
    end

    def delete_resource(resource)
      @token.refresh if @token.expired?
      response = @token.delete(resource)
      JSON.parse response.body, :symbolize_names => true
    end
  end
end
