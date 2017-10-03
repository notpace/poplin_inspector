# The poplin inspector dashboard allows end users to probe messaging standards
class DashboardController < ApplicationController
  require 'bunny'
  def index; end

  def publish
    # TODO: Verify connection and recover from failure with a message to the user
    conn = Bunny.new('amqp://' + ENV['RABBITMQ_URL']) # Will default host to localhost unless RABBITMQ_URL env var is set
    conn.start
    ch = conn.create_channel
    x = ch.fanout(params[:pub_exchange][0])
    ch.queue(params[:pub_queue][0]).bind(x).subscribe # TODO: Figure out a way to modify this
    x.publish(params[:pub_message][0])
    sleep 0.5
    x.delete
    conn.close
    respond_to do |format|
      format.json { head :ok }
      format.html
    end
  end

  def list_messages
    @messages = Message.all
    respond_to do |format|
      format.html { render layout: false }
    end
  end

  def delete_messages
    Message.delete_all
  end
end
