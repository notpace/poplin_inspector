# Messages received by the Poplin Inspector
class MessagesController < ApplicationController
  include RabbitEnvironment
  require 'bunny'

  def index
    @messages = Message.user(@user.id).all
    respond_to do |format|
      format.html { render partial: 'list_messages', layout: false }
    end
  end

  def delete_all
    Message.user(@user.id).delete_all
  end
end
