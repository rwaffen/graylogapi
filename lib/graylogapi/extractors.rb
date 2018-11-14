class GraylogAPI
  # class for manage Extractors of an input
  class Extractors
    def initialize(client)
      @client = client
    end

    # add key to an input
    #
    # @param input_id [Integer] id of an input
    # @param params [Hash] hash with key and value of new extractor
    # @return [GraylogAPI::Client::Response]
    def create(input_id, params)
      @client.request(:post, "/system/inputs/#{input_id}/extractors", params)
    end

    # delete key of an input
    #
    # @param input_id [Integer] id of an input
    # @param key [String] key of extractor
    # @return [GraylogAPI::Client::Response]
    def delete(input_id, key)
      @client.request(:delete, "/system/inputs/#{input_id}/extractors/#{key}")
    end
  end
end
