$(document).ready(function(){
  $(".header-pull-list-parent").hover(
    function(){
      $(".header-pull-list").show();
    },
    function(){
      $(".header-pull-list").hide();
    }
  ); 
});