# If the RABBITMQ_URL is not set, default it to localhost
ENV['RABBITMQ_URL'] = 'localhost' if ENV['RABBITMQ_URL'].blank?

# Connect to the RabbitMQ server at startup and leave the connection open
# TODO: develop a connection that comes down gracefully with the server
conn = Bunny.new('amqp://' + ENV['RABBITMQ_URL']) # Will default host to localhost unless RABBITMQ_URL env var is set
conn.start
input_queue = 'messages'
ch = conn.create_channel
q = ch.queue(input_queue)
q.subscribe(block: false) do |delivery_info, _properties, body|
  Message.create(
    text: body,
    exchange: delivery_info.exchange,
    queue: input_queue
  )
end
