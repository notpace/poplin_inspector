# Poplin Inspector instances maintain subscriptions to messages queues
class SubscriptionsController < ApplicationController
  include RabbitEnvironment
  require 'bunny'

  def index
    @subscriptions = Subscription.user(@user.id).all
    respond_to do |format|
      format.html { render partial: 'list_subscriptions', layout: false }
    end
  end

  def create
    conn = Bunny.new(@rabbitmq_server) # Will default host to localhost unless RABBITMQ_URL env var is set
    conn.start
    queue_to_sub = params[:queue_to_sub][0]
    ch = conn.create_channel
    q = ch.queue(queue_to_sub)
    q.subscribe(block: false) do |delivery_info, _properties, body|
      Message.create(
        user_id: @user.id,
        text: body,
        exchange: delivery_info.exchange,
        queue: queue_to_sub
      )
    end
    Subscription.create(queue: queue_to_sub, user_id: @user.id)
  end

  def delete_all
    # TODO: Actually close the connection to the RabbitMQ server.
    # They are automatically closed when the server goes down, but the following code only removes it locally and does not close the connection.
    # Subscription.each do |sub|
    #   conn.queue_exists?(sub.queue)
    # end
    Subscription.user(@user.id).delete_all
  end

  # TODO: Set up the AJAX link_to in _list_subscriptions.html.erb
  # def destroy
  #   # TODO: Actually close the connection to the RabbitMQ server.
  #   # They are automatically closed when the server goes down, but the following code only removes it locally and does not close the connection.
  #   # Subscription.each do |sub|
  #   #   conn.queue_exists?(sub.queue)
  #   # end
  #   byebug
  #   Subscription.find(params[:queue]).destroy
  # end
end
