# Sets up the user's RabbitMQ Environment
module RabbitEnvironment
  def self.included(base)
    base.before_action :set_rabbitmq_env
  end

  def set_rabbitmq_env
    @rabbitmq_server = (ENV['RABBITMQ_URL'][0, 7] == 'amqp://' ? ENV['RABBITMQ_URL'] : 'amqp://' + ENV['RABBITMQ_URL'])
    @user = User.find_or_create_by(user: ENV['POPLIN_INSPECTOR_NAME'])
  end
end
