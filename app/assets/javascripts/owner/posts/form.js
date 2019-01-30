$(document).ready(function(){
   addParagraph();
   $("#addParagraphBtn").on("click", function(){
      addParagraph(); 
   });
   
   $(document).on("change",".apply-box", function(){
      applyToPreview(); 
   });
});

function addParagraph(){
  $template = $(".template");
  $cloneTemplate = $template.clone();
  $cloneTemplate.removeClass("template");
  $cloneTemplate.appendTo(".main-text"); 
}

function applyToPreview(){
    var $textsWrap = $(".main-text");
    var $texts = "";
    $textsWrap.children().each(function(index, element){
       $position = $(element).find(".alignment").val();
       $size = $(element).find(".fontsize").val();
       $text = $(element).find("textarea").val().replace(/\r?\n/g, '<br>');
       $texts += "<div class='" + "size" + $size + " " + $position + "'>" + $text + "</div>"
    });
    $(".preview").html($texts);
}