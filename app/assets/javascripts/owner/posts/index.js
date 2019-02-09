$(document).ready(function(){
  $(".read-status").on("click", function(){
    var modal_id = $(this).data("modal-id");
    var $modal_wrap = $("#modal" + modal_id);
    $modal_wrap.addClass("active");
  });
  
  $(document).on("click",".close-button", function(){
    var modal_id = $(this).data("modal-id");
    var $modal_wrap = $("#modal" + modal_id);
    $modal_wrap.removeClass("active");
  });
  
  $(document).on("click",".house-name",function(){
    var $list = $(this).siblings(".read-status-list");
    var $icon = $(this).find("i");
    if($list.is(":hidden")){
      $list.slideDown();
      $icon.removeClass("fa-chevron-down");
      $icon.addClass("fa-chevron-up");
    }else{
      $list.slideUp();
      $icon.addClass("fa-chevron-down");
      $icon.removeClass("fa-chevron-up");
    }
  });
});