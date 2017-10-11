# The poplin inspector dashboard allows end users to probe messaging standards
class DashboardController < ApplicationController
  require 'bunny'

  before_action :set_rabbitmq_env

  # Ensure that the RABBITMQ_URL variable starts with 'amqp://'
  def set_rabbitmq_env
    @rabbitmq_server = (ENV['RABBITMQ_URL'][0, 7] == 'amqp://' ? ENV['RABBITMQ_URL'] : 'amqp://' + ENV['RABBITMQ_URL'])
  end

  def index; end

  # TODO: DRY up this code:
  # - list_messages and list_subscriptions do the same thing with different objects
  # - connection and channel opening in publish and create_sub_to_queue methods

  def publish
    # TODO: Verify connection and recover from failure with a message to the user
    conn = Bunny.new(@rabbitmq_server) # Will default host to localhost unless RABBITMQ_URL env var is set
    conn.start
    ch = conn.create_channel
    x = ch.fanout(params[:pub_exchange][0])
    ch.queue(params[:pub_queue][0]).bind(x).subscribe
    x.publish(params[:pub_message][0])
    sleep 0.5
    x.delete
    conn.close
    respond_to do |format|
      format.json { head :ok }
      format.html
    end
  end

  def create_sub_to_queue
    conn = Bunny.new(@rabbitmq_server) # Will default host to localhost unless RABBITMQ_URL env var is set
    conn.start
    queue_to_sub = params[:queue_to_sub][0]
    ch = conn.create_channel
    q = ch.queue(queue_to_sub)
    q.subscribe(block: false) do |delivery_info, _properties, body|
      Message.create(
        text: body,
        exchange: delivery_info.exchange,
        queue: queue_to_sub
      )
    end
    Subscription.create(queue: queue_to_sub)
  end

  def list_messages
    @messages = Message.all
    respond_to do |format|
      format.html { render partial: 'dashboard/list_messages', layout: false }
    end
  end

  def list_subscriptions
    @subscriptions = Subscription.all
    respond_to do |format|
      format.html { render partial: 'dashboard/list_subscriptions', layout: false }
    end
  end

  def delete_messages
    Message.delete_all
  end

  # TODO: Set up the AJAX link_to in _list_subscriptions.html.erb
  # def delete_subscription
  #   # TODO: Actually close the connection to the RabbitMQ server.
  #   # They are automatically closed when the server goes down, but the following code only removes it locally and does not close the connection.
  #   # Subscription.each do |sub|
  #   #   conn.queue_exists?(sub.queue)
  #   # end
  #   byebug
  #   Subscription.find(params[:queue]).destroy
  # end

  def delete_subscriptions
    # TODO: Actually close the connection to the RabbitMQ server.
    # They are automatically closed when the server goes down, but the following code only removes it locally and does not close the connection.
    # Subscription.each do |sub|
    #   conn.queue_exists?(sub.queue)
    # end
    Subscription.delete_all
  end
end
