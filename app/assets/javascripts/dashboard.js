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
$(document).ready( function(){
  get_messages();
  setInterval(function(){
    get_messages();
  }, 1000);
  $("#delete").click( function(){
    delete_messages();
  });
});
