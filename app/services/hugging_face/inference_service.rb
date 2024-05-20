require 'json'
require 'faraday'
require 'logger'

module HuggingFace
  class InferenceService < BaseService
    def call(inputs)
      request connection: connection, input: { inputs: inputs }
    end

    private

    def connection()
      build_connection "#{HOST}/models/#{MODEL}"
    end
  end
end
