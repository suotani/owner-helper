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
});