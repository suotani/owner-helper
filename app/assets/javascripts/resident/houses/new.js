$(document).ready(function(){
    $(".house_name").on("click",function(){
      const house_id = $(this).data("id");
      const house_name = $(this).data("name");
      $("#house_name").val(house_name);
      $("#house_id").val(house_id);
    });
});