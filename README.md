# Poplin Inspector
At its core, the [Poplin Project](http://projectpoplin.org) seeks to promote modern, modular Medicaid IT systems by improving communication between those systems.  Poplin Inspector verifies that Medicaid IT systems are conforming to the data standards set out in the Poplin service definitions.

# Environment Setup
Ensure that the following environment variables are set when the machine is created:
- **RABBITMQ_URL**: The full server address of the RabbitMQ messaging server
- **POPLIN_INSPECTOR_NAME**: A human name given to this instance of the Poplin Inspector (to distinguish between different deployments)

Note: on OSX, this is `export RABBITMQ_URL=Server_Address`, but when deploying in OpenShift, set these through the deployment instructions

# TODO
- Implement the [RabbitMQ tutorial scripts](https://www.rabbitmq.com/getstarted.html) in a nice front end to show Pub/Sub and Request/Response message patterns
- Demonstrate a simple communication with the [Synthea FHIR server](https://github.com/synthetichealth)
- Demonstrate a simple communication with the [Provider Screening Module](https://github.com/OpenTechStrategies/psm)
- Determine whether we can integrate portions of [Crucible FHIR server Testing](https://github.com/fhir-crucible/) into Poplin

# Helpful Links
- [Bunny gem Documentation](http://rubybunny.info/articles/guides.html)
- [Rails and RabbitMQ Smoke Tests](http://alihuber.github.io/fun-with-rabbitmq-2/)
- [RabbitMQ Rails client to view Smoke Tests](https://github.com/alihuber/rabbitmq_showcase)
- [RabbitMQ as a Message Queue](http://blog.sundaycoding.com/blog/2015/03/22/using-message-queue-in-rails/)
- [Working with AJAX in Ruby on Rails](http://guides.rubyonrails.org/working_with_javascript_in_rails.html)
- [Blog post on AJAX with `remote: true`](https://medium.com/@AdamKing0126/ajax-and-rails-demystifying-remote-true-fe51ba2ce819)
- RabbitMQ Exchanges, Queues, and Bindings: [Part 1](https://www.compose.com/articles/configuring-rabbitmq-exchanges-queues-and-bindings-part-1/) and [Part 2](https://www.compose.com/articles/configuring-rabbitmq-exchanges-queues-and-bindings-part-2/)
- [Bootstrap Documentation](http://getbootstrap.com/docs/4.0/getting-started/introduction/)

# README TODO
* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
