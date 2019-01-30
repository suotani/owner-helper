$(document).ready(function(){
   addParagraph();
   applyToPreview()
   $("#addParagraphBtn").on("click", function(){
      addParagraph();
   });
   
   $(document).on("change",".apply-input", function(){
      applyToPreview();
   });

   $(document).on("keyup",".apply-box", function(){
      applyToPreview();
   });
   
   $(document).on("click", ".remove-button", function(){
      $(this).parent().remove();
      applyToPreview();
   });
   
   $(".submit-btn").on("click", function(){
       $("#post_text").val(createText());
       $("#post_post_at").val(createDatetime());
       $("form").submit();
       
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
       $texts += "<div class='paragraph " + "size" + $size + " " + $position + "'>" + $text + "</div>"
    });
    $(".preview").html($texts);
}

function createText(){
    var $textsWrap = $(".main-text");
    var $texts = "";
    $textsWrap.children().each(function(index, element){
       $position = $(element).find(".alignment").val();
       $size = $(element).find(".fontsize").val();
       $text = $(element).find("textarea").val();
       $texts += "$$" + $position + "," + $size + "$$" + $text + "$end$";
    });
    return $texts;
}

function createDatetime(){
    var y = $("#year").val();
    var m = $("#month").val();
    var d = $("#day").val();
    var h = $("#hour").val();
    return y + "/" + m + "/" + d + " " + h + ":00:00";
}