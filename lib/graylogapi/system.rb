require 'graylogapi/system/inputs'
require 'graylogapi/system/index_sets'

class GraylogAPI
  # class for manage system
  class System
    def initialize(client)
      @client = client
    end

    # object for manage System/Inputs
    #
    # @return GraylogAPI::System::Inputs
    def inputs
      @inputs ||= Inputs.new(@client)
    end

    def index_sets
      @index_sets ||= IndexSets.new(@client)
    end
  end
end
