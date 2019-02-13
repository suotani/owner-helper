$(document).ready(function(){
  $("#menu-toggle").on("click",function(){
    if($(".sp .header-pull-list").is(":hidden")){
      $(".sp .header-pull-list").slideDown();
    }else{
      $(".sp .header-pull-list").slideUp();
    }
  });

  $("#menu-toggle").on("click",function(){
    if($(".sp .header-menu-wrap").is(":hidden")){
      $(".sp .header-menu-wrap").slideDown();
    }else{
      $(".sp .header-menu-wrap").slideUp();
    }
  });

  $(".pc.header-pull-list-parent").hover(
    function(){
      $(".pc .header-pull-list").show();
    },
    function(){
      $(".pc .header-pull-list").hide();
    }
  ); 
});
