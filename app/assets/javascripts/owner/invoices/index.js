$(document).ready(function(){
    $(".status a").on("click", function(){
        $(".modal-wrap").show();
    });
    
    $(".modal-close-btn").on("click", function(){
        $(".modal-wrap").hide();
        $("#modal").html("");
    });
});
