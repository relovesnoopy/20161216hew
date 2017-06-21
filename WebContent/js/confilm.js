$(function(){

$("form").submit(function(){

var err = 0;
//郵便番号
if($("input[name='zip11']").val()==""){
if($("span#zip11").css("color") != "red"){
$("input[name='zip11']").css("border","1px solid red").after("<br><span id='zip11'>郵便番号を入力してください</span>");
$("span#zip11").css("color","red");
}
err = 1;
}else{
$("input[name='zip11']").css("border","1px solid gray");
$("span#zip11").text("");
$("span#zip11").css("color","gray");
}

//住所
if($("input[name='addr11']").val()==""){
if($("span#addr11").css("color") != "red"){
$("input[name='addr11']").css("border","1px solid red").after("<br><span id='addr11'>住所を入力してください</span>");
$("span#addr11").css("color","red");
}
err = 1;
}else{
$("input[name='addr11']").css("border","1px solid gray");
$("span#addr11").text("");
$("span#addr11").css("color","gray");
}

//姓
if($("input[name='fname']").val()==""){
if($("span#fname").css("color") != "red"){
$("input[name='fname']").css("border","1px solid red").after("<br><span id='fname'>姓を入力してください</span>");
$("span#fname").css("color","red");
}
err = 1;
}else{
$("input[name='fname']").css("border","1px solid gray");
$("span#fname").text("");
$("span#fname").css("color","gray");
}

//名
if($("input[name='lname']").val()==""){
if($("span#lname").css("color") != "red"){
$("input[name='lname']").css("border","1px solid red").after("<br><span id='lname'>お名前を入力してください</span>");
$("span#lname").css("color","red");
}
err = 1;
}else{
$("input[name='lname']").css("border","1px solid gray");
$("span#lname").text("");
$("span#lname").css("color","gray");
}


//メールアドレス
if($("input[name='mail']").val()==""){
if($("span#mail").css("color") != "red"){
$("input[name='mail']").css("border","1px solid red").after("<br><span id='mail'>メールアドレスを入力してください</span>");
$("span#mail").css("color","red");
}
err = 1;
}else{
$("input[name='mail']").css("border","1px solid gray");
$("span#mail").text("");
$("span#mail").css("color","gray");
}

//電話番号
if($("input[name='tel']").val()==""){
if($("span#tel").css("color") != "red"){
$("input[name='tel']").css("border","1px solid red").after("<br><span id='tel'>電話番号を入力してください</span>");
$("span#tel").css("color","red");
}
err = 1;
}else{
$("input[name='tel']").css("border","1px solid gray");
$("span#tel").text("");
$("span#tel").css("color","gray");
}




if(err==1){
return false;

}

}); // end of submit

});