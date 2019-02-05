$(document).ready(function(){
  $("#menu-toggle").on("click",function(){
    console.log("aaa");
    if($(".sp .header-pull-list").is(":hidden")){
      console.log("s");
      $(".sp .header-pull-list").show();
    }else{
      console.log("h");
      $(".sp .header-pull-list").hide();
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
