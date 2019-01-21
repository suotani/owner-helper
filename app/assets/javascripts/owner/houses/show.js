$(document).ready(function(){
   $(".edit-btn").click(function(){
      $(".house-read").hide();
      $(".house-form").show();
   });
 
   $(".cancel-btn").click(function(){
      $(".house-form").hide();
      $(".house-read").show();
   });
   
   if($("#error_explanation").length !== 0){
      $(".house-form").show();
      $(".house-read").hide();
      $(".cancel-btn").hide();
   }
   
   $(".room-add-btn").click(function(){
       $(".modal-wrap").show();
   });
   
   $(".room-add-cancel-btn").click(function(){
      $(".modal-wrap").hide(); 
   });
});