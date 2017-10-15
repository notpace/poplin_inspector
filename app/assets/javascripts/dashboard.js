// Get the messages from the database and list them on the page
function get_messages() {
  $.get({ url: 'messages', dataType: 'html' })
    .done(function(data) {
      $("#messages_table").replaceWith(data)
    });
};
function delete_messages() {
  $.ajax({ type: "DELETE", url: '/messages/delete_all' })
    .done(function(data) {
      get_messages();
    });
};
// Get queue subscriptions from the database and list them on the page
function get_subscriptions() {
  $.get({ url: 'subscriptions', dataType: 'html' })
    .done(function(data) {
      $("#subscriptions").replaceWith(data)
    });
};
function delete_subscriptions() {
  $.ajax({ type: "DELETE", url: '/subscriptions/delete_all' })
    .done(function(data) {
      get_subscriptions();
    });
};

// On load, do a few things...
$(document).ready( function(){
  // Set the refresh functions to run on a 1-second interval
  var refresh_messages = function() {
    get_messages();
    setTimeout(refresh_messages, 1000);
  }
  setTimeout(refresh_messages, 1000);
  var refresh_subscriptions = function() {
    get_subscriptions();
    setTimeout(refresh_subscriptions, 1000);
  }
  setTimeout(refresh_subscriptions, 1000);
  // Initialize the delete_all buttons
  $("#delete_subscriptions").click( function(){
    delete_subscriptions();
  });
  $("#delete_messages").click( function(){
    delete_messages();
  });
  // Clear out the pub_message and pub_exchange boxes when publish is clicked
  $("#publish").click( function(){
    setTimeout(function(){
      // extra underscore is not a typo -- rails appends it to the element id for some reason
      $("#pub_message_").val('')
      $("#pub_exchange_").val('')
    }, 500);
  });
  // Clear out the queue_to_sub and exchange_to_sub boxes when create_subscription is clicked
  $("#create_subscription").click( function(){
    setTimeout(function(){
      // extra underscore is not a typo -- rails appends it to the element id for some reason
      $("#queue_to_sub_").val('')
      $("#exchange_to_sub_").val('')
    }, 500);
  });
});
