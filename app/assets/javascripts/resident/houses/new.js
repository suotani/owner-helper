$(document).ready(function(){
    $(".house_name").on("click",function(){
      var house_id = $(this).data("id");
      var house_name = $(this).data("name");
      $("#house_name").text(house_name);
      $("#house_id").val(house_id);
    });
});