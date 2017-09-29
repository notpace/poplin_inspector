# If the RABBITMQ_URL is not set, default it to localhost
ENV['RABBITMQ_URL'] = 'localhost' if ENV['RABBITMQ_URL'].blank?
