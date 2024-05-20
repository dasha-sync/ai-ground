require 'json'
require 'logger'
require 'faraday'

module HuggingFace
  class BaseService
    attr_reader :headers

    HOST = "https://api-inference.huggingface.co"
    MODEL = 'bigscience/bloom'

    def initialize()
      @headers = {
        'Authorization' => "Bearer #{Rails.application.credentials.hugging_face[:api_token]}",
        'Content-Type' => 'application/json'
      }
    end

    protected

    def build_connection(url)
      Faraday.new(url, headers: @headers)
    end

    def request(connection:, input:, params: nil)
      response = connection.post { |req|
        req.body = input.to_json
        req.params = params if params
      }

      if response.success?
        return JSON.parse(response.body)
      end
    end
  end
end
