$(document).ready(function(){
  $("#invitation_check").on("click", function(){
      $(this).text("Checking...");
      $.ajax({
          url: '/owners/registrations/invitation_owner',
          type: 'get',
          data: {
            'invitation_code': $("#invitation_owner_code").val()
          }
      }); 
  });
});