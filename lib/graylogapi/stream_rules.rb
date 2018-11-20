class GraylogAPI
  # class for manage StreamRules of a Stream
  class StreamRules
    def initialize(client)
      @client = client
    end

    # add rule to a stream
    #
    # @param stream_id [Integer] id of a stream
    # @param params [Hash]
    # @return [GraylogAPI::Client::Response]
    def create(stream_id, params)
      @client.request(:post, "/streams/#{stream_id}/rules", params)
    end

    # update a stream rule
    #
    # @param stream_id [Integer] id of a stream
    # @param stream_rule_id [Integer] id of a stream rule
    # @param params [Hash]
    # @return [GraylogAPI::Client::Response]
    def update(stream_id, stream_rule_id, params)
      @client.request(:put, "/streams/#{stream_id}/rules/#{stream_rule_id}", params)
    end

    # delete rules of a stream
    #
    # @param stream_id [Integer] id of a stream
    # @param stream_rule_id [String] id of a stream rule
    # @return [GraylogAPI::Client::Response]
    def delete(stream_id, key)
      @client.request(:delete, "/streams/#{stream_id}/rules/#{stream_rule_id}")
    end
  end
end
