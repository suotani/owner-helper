$(document).ready(function(){

  var obj = document.getElementById("chat-scroll");
  obj.scrollTop = obj.scrollHeight;

  $.ajax({
    url: $("#read_url").val(),
    type: 'get',
    data: {}
  });

  $('form').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".preview");
        t = this;

    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        //既存のプレビューを削除
        $preview.empty();
        // 削除ボタン表示
        $preview.append('<span class="media-remove-button"><i class="fas fa-times"></i></span>');
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append($('<img>').attr({
            src: e.target.result,
            width: "50px",
            title: file.name
        }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
  
  $('form').on("click", ".media-remove-button", function(){
    $("#media").val("");
    $(".preview").empty();
  });
});