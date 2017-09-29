class DashboardController < ApplicationController
  require 'bunny'
  def index; end

  def publish
    # TODO: Verify connection and recover from failure with a message to the user
    conn = Bunny.new(host: ENV['RABBITMQ_URL'])
    conn.start
    ch = conn.create_channel
    x = ch.fanout(params[:pub_label][0])
    x.publish(params[:pub_message][0])
    sleep 0.5
    x.delete
    conn.close
    respond_to do |format|
      format.json { head :ok }
      format.html
    end
  end
end
