# The poplin inspector dashboard allows end users to probe messaging standards
class DashboardController < ApplicationController
  include RabbitEnvironment
  require 'bunny'

  def index; end

  def publish
    # TODO: Verify connection and recover from failure with a message to the user
    conn = Bunny.new(@rabbitmq_server) # Will default host to localhost unless RABBITMQ_URL env var is set
    conn.start
    ch = conn.create_channel
    x = ch.fanout(params[:pub_exchange][0], durable: true)
    x.publish(params[:pub_message][0])
    sleep 0.5
    conn.close
    # respond_to do |format|
    #   format.json { head :ok }
    #   format.html
    # end
  end
end
