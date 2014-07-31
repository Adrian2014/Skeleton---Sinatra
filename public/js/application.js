$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()


  $('#create_note').on('submit', function(event){
    event.preventDefault();
    console.log("click");
    var data = $(this).serialize();
    var form = this;

    $.ajax({
      type: "POST",
      url: '/welcome',
      data: data,
      success: function(data) {

        $('.welcome-container ol').append('<li>Topic - '+data.topic+' </br> Note -'+data.text+' </br> </li></br>');

          form.reset();
      },
      dataType: 'JSON'
    }); 
  });
});


  
   