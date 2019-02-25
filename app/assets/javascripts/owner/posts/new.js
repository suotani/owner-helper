$(document).ready(function(){
  $(".checkbox-input").on("change", function(){
    if($(this).is(":checked")){
        $(this).parent().addClass("parent");
    }else{
        $(this).parent().removeClass("parent")
    }
  });
  
  $("#all").on("change", function(){
     if($(this).is(":checked")){
         $(".houses .checkbox-input").each(function(index, element){
             if(!$(element).is(":checked")){
                 $(element).click();
             }
         });
     }else{
         $(".houses .checkbox-input").each(function(index, element){
             if($(element).is(":checked")){
                 $(element).click();
             }
         });
     }
  });
 

   $(".submit-btn").on("click", function(){
       $("#post_post_at").val(createDatetime());
       $("form").submit();
       
   });
});


function createDatetime(){
    var y = $("#year").val();
    var m = $("#month").val();
    var d = $("#day").val();
    var h = $("#hour").val();
    return y + "/" + m + "/" + d + " " + h + ":00:00";
}