# If the RABBITMQ_URL is not set, default it to localhost
ENV['RABBITMQ_URL'] = 'localhost' if ENV['RABBITMQ_URL'].blank?

# If the POPLIN_INSPECTOR_NAME has not been created as a user, create them
User.find_or_create_by(user: ENV['POPLIN_INSPECTOR_NAME'])
