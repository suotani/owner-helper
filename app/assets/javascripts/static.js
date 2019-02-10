$(document).ready(function(){
  $(".dropdown-menu-wrap").hover(
    function(){
      $(this).find(".dropdown-menu").show();
    },
    function(){
      $(this).find(".dropdown-menu").hide();
    }
  );
  
  $("#menu-toggle").on("click", function(){
    if($(".menu-wrap").is(":hidden")){
      $(".menu-wrap").slideDown();
    }else{
      $(".menu-wrap").slideUp();
    }
  });
  
  $(".slide").click(function(){
    $(".slider-item").each(function(i,e){
      $(e).removeClass("active");
    });
    $(".buttons li").each(function(i,e){
      $(e).removeClass("active");
    });
    
    var target = $(this).data("to");
    console.log(target);
    console.log($("." + target));
    $("." + target).each(function(i,e){
      $(e).addClass("active");
    });
  });
});