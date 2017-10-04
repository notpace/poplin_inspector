// Get the messages from the database and list them on the page
function get_messages() {
  $.get({ url: '/dashboard/list_messages', dataType: 'html' })
    .done(function(data) {
      $("#messages_table").replaceWith(data)
    });
};
function delete_messages() {
  $.ajax({ type: "DELETE", url: '/dashboard/delete_messages' })
    .done(function(data) {
      get_messages();
    });
};
// Get queue subscriptions from the database and list them on the page
function get_subscriptions() {
  $.get({ url: '/dashboard/list_subscriptions', dataType: 'html' })
    .done(function(data) {
      $("#subscriptions_table").replaceWith(data)
    });
};
function delete_subscriptions() {
  $.ajax({ type: "DELETE", url: '/dashboard/delete_subscriptions' })
    .done(function(data) {
      get_subscriptions();
    });
};

// On load, set a few things...
$(document).ready( function(){
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
  $("#delete_subscriptions").click( function(){
    delete_subscriptions();
  });
  $("#delete_messages").click( function(){
    delete_messages();
  });
  // Clear out the queue_to_sub box when create_subscription is clicked
  $("#create_subscription").click( function(){
    setTimeout(function(){
      // extra underscore is not a typo -- rails appends it to the element id for some reason
      $("#queue_to_sub_").val('')
    }, 500);
  });
});
