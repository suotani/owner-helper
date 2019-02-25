$(document).ready(function(){
  $(".phone-modal-open").on("click", function(){
    var $info = $(this).find(".info");
    $(".modal-resident-name").text($info.data("name"));
    $(".modal-resident-phone-number").text($info.data("phone"));
    $(".modal-house-room").text($info.data("house"));
    $phone_number = $info.data("phone").replace(/-/g, "")
    $(".exec-tell").attr("href", "tel:" + $phone_number);
    $(".modal-wrap").show();
  });
  
  $(".cancel").on("click", function(){
    $(".modal-wrap").hide();
  });
  
  $(".tell").on("click", function(){
    $(".exec-tell")[0].click();
  });
});