libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'graylogapi/version'
require 'graylogapi/alerts'
require 'graylogapi/client'
require 'graylogapi/dashboards'
require 'graylogapi/streams'
require 'graylogapi/system'

# class for work with graylog api
class GraylogAPI
  # @return [GraylogAPI::Client]
  attr_reader :client

  # Initializes a new GraylogAPI object
  #
  # @param options [Hash]
  # @return [GraylogAPI]
  def initialize(options = {})
    @client = Client.new(options)
  end

  # @return [GraylogAPI::Alerts]
  def alerts
    @alerts ||= Alerts.new(@client)
  end

  # @return [GraylogAPI::System]
  def system
    @system ||= System.new(@client)
  end

  # @return [GraylogAPI::Streams]
  def streams
    @streams ||= Streams.new(@client)
  end

  # @return [GraylogAPI::Dashboards]
  def dashboards
    @dashboards ||= Dashboards.new(@client)
  end
end
