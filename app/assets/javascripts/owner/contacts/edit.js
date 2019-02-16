$(document).ready(function(){
  var obj = document.getElementById("chat-scroll");
  obj.scrollTop = obj.scrollHeight;
  
  $(".message").on("click", function(){
    var $short = $(this).find(".short");
    var $long = $(this).find(".long")
    if($short.is(':hidden')){
      $short.show();
      $long.hide();
    }else{
      $short.hide();
      $long.show();
    }
  });
  $.ajax({
    url: $("#read_url").val(),
    type: 'get',
    data: {}
  });
  
});