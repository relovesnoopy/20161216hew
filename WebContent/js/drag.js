//ロゴのドラッグ
$('#draggable').draggable( {
	containment: '#draggableArea',
	scroll: false,
});
//テキストエリアのドラッグ
$('#txt').draggable({
	containment: '#draggableArea',
	scroll: false,
});

//ロゴのサイズ変更
$("#draggable").resizable({
  alsoResize: "#logo",
	handles: 's',
	aspectRatio:true,
	minHeight: 50,
	minWidth: 50,
	maxHeight: 200,
	maxWidth: 200,
});

//テキストエリアのサイズ変更
$("#txt").resizable({
	alsoResize:"#txts",
	handles: 's',
	aspectRatio:true,
	minHeight: 50,
	minWidth: 50,
	maxHeight: 200,
	maxWidth: 200,
});

//ssの生成
function screenshot(selector){
    var element = $(selector)[0];
    html2canvas(element,{onrendered: function(canvas) {
    	var imgData = canvas.toDataURL();
    	//Blob変換試し
    	var type = 'image/png';
    	// canvas から DataURL で画像を出力
    	// DataURL のデータ部分を抜き出し、Base64からバイナリに変換
    	var bin = atob(imgData.split(',')[1]);
    	// 空の Uint8Array ビューを作る
    	var buffer = new Uint8Array(bin.length);
    	// Uint8Array ビューに 1 バイトずつ値を埋める
    	for (var i = 0; i < bin.length; i++) {
    		buffer[i] = bin.charCodeAt(i);
    	}
    	// Uint8Array ビューのバッファーを抜き出し、それを元に Blob を作る
    	var blob = new Blob([buffer.buffer]);
    	var url = window.URL.createObjectURL(blob);
    	//変換試しここまで
    	//srcに画像埋め込み
    	$('#screen_image')[0].src = imgData;

    	//formのvalueにセットする
    	var form = document.form;
    	//imageにbase64 image2にはblobを
    	form.image.value = imgData;
    	//form.image2.value = url;
    	$("#blob").val(url);
    	$('#form_id').submit();
    }});
}

//ssの消去
function erase_screenshot() {
    $('#screen_image')[0].src = "";
}

$(document).ready(function(){
  //画像切り替え、#logoの内容を変更する。
	$("ul > li > a").click(function(){
		var src = $(this).attr("href");
		$("#logo").fadeOut("fast",function() {
			$(this).attr("src",src);
			$(this).fadeIn();
		});
		return false;
	});
});

//ボタンでロゴの表示/非表示切り替え
$('#toggle').on('click', function(){
	$('#draggable').toggle('fast');
});

$('#toggle').on('click', function(){
	$('#item').toggle('fast');
});

//テキストの表示/非表示切り替え
$('#toggle2').on('click', function(){
	$('#txt').toggle('fast');
});




//サムネイルクリック画像切り替え
$(function(){
	$('img.thumb').click(function(){
		var selectedSrc = $(this).attr('src');
		$('img.draggableArea').stop().fadeOut(50,function(){
			$('img.draggableArea').attr('src', selectedSrc);
			$('img.draggableArea').stop().fadeIn(200);
		});
	});
});
//お気に入りページの表示切り替え
