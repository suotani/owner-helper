$(document).ready(function(){
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
});