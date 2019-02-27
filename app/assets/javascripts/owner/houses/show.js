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
     $(".add-room-modal").show();
   });
   
   $(".room-add-cancel-btn").click(function(){
      $(".add-room-modal").hide();
      $(".add-resident-modal").hide(); 
   });

   $(".add-resident-modal-open").click(function(){
     var $info = $(this);
     $("#id").val($info.data("id"));
     $("#room_number").val($info.data("number"));
     $("#room_resident_name").val($info.data("name"));
     $("#room_resident_name_kana").val($info.data("kana"));
     $("#room_resident_phone_number").val($info.data("phone"));
     $(".add-resident-modal").show();
   });
   
   $("#remove").on("click", function(){
     $("#room_resident_name").val("");
     $("#room_resident_name_kana").val("");
     $("#room_resident_phone_number").val("");
     $(this).find(".loading").show();
     $("#room_resident_form").submit();
   });
});