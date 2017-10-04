# Poplin Inspector
At its core, the [Poplin Project](http://projectpoplin.org) seeks to promote modern, modular Medicaid IT systems by improving communication between those systems.  Poplin Inspector verifies that Medicaid IT systems are conforming to the data standards set out in the Poplin service definitions.

# Environment Setup
Ensure that the following environment variables are set when the machine is created:
- `RABBITMQ_URL`: The full server address of the RabbitMQ messaging server, e.g. `amqp://rabbitmq-amqp-myproject.192.168.64.2.nip.io` (make sure the address begins with `amqp://` rather than `https://`).  When deploying on OpenShift, make sure you have set up the AMQP route properly.  TODO: fix this route ([something to do with TCP/SNI?](https://blog.zhaw.ch/icclab/openshift-custom-router-with-tcpsni-support))
- `POPLIN_INSPECTOR_NAME`: A human name given to this instance of the Poplin Inspector to distinguish between different deployments (e.g., Alice, Bob, Charlie)
- Set `SECRET_KEY_BASE`, `SECRET_KEY`, `SECRET_TOKEN`, and `RAILS_SERVE_STATIC_FILES` to arbitrary values (foo/bar/baz if you like) to set up the environment and actually serve pipeline assets.  TODO: figure out better solutions for these items.

# TODO
- RabbitMQ tutorial scripts](https://www.rabbitmq.com/getstarted.html) in a nice front end to show the following message patterns:
  - ~~Pub/Sub Fanout - done~~
  - Pub/Sub by Routing Key
  - Request/Response
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
- [RabbitMQ Exchanges, Queues, and Bindings: [Part 1](https://www.compose.com/articles/configuring-rabbitmq-exchanges-queues-and-bindings-part-1/) and [Part 2](https://www.compose.com/articles/configuring-rabbitmq-exchanges-queues-and-bindings-part-2/)
- [Bootstrap Documentation](http://getbootstrap.com/docs/4.0/getting-started/introduction/)
- [RabbitMQ – Best Practices For Designing Exchanges, Queues And Bindings](https://derickbailey.com/2015/09/02/rabbitmq-best-practices-for-designing-exchanges-queues-and-bindings/)

# README TODO
* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions