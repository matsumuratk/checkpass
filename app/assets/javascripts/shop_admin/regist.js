//
// regist時の表示切り替え処理
//
//同意チェック チェックが入ったら利用開始ボタンをenableに。
$(function(){
  $('#policy_agreement').change(function() {
    if($(this).is(':checked')){
      $("#submit").attr("src","/assets/shop_admin/riyoukaisi_enable.png");
      $("#submit").attr("disabled", false);
    }else{
      $("#submit").attr("disabled", true);
      $("#submit").attr("src","/assets/shop_admin/riyoukaisi_disable.png");
    }
  });
});

