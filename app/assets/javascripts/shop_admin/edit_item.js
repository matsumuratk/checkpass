//
// edit_item's event javascript
// プレビュー表示処理、入力チェック処理
//

/*
	ページの表示時、iframeの表示でスクロールしてしまうので、強制的に戻す。
*/
$(function(){
  $(window).load(function() {
    $('html,body').animate({ scrollTop: 0 }, 'fast');
  });
});

/*
	フォーム内のラベル位置を揃える。
	function adjust_label() は、shop_admin/common.js内
	#facebook_item
*/

$(document).ready(function() { 
	adjust_label("#facebook_item");
	adjust_label("#fbwall_item_message");
});

/*
 facebook place ローディング時にクルクルを出す
*/
$(function(){
  $("#search_name_form")
    .on('ajax:beforeSend',function(){ $("#spin").spin(); })
    .on('ajax:success',function(){ $("#spin").spin(false); })
    .on('ajax:error',function(){ $("#spin").spin(false); })
    .on('ajax:complete',function(){ $("#spin").spin(false); });
});
$(function(){
  $(".search_ajax_spin")
    .on('ajax:beforeSend',function(){ $("#spin").spin(); })
    .on('ajax:success',function(){ $("#spin").spin(false); })
    .on('ajax:error',function(){ $("#spin").spin(false); })
    .on('ajax:complete',function(){ $("#spin").spin(false); });
});

/*
  入力項目の選択
*/
$(function(){
  $('input[name="checkin_item[top_image_select]"]:radio')
    .ready(function(){
     $("#top_image_select_"+(3-$('input[name="checkin_item[top_image_select]"]:radio').val())).hide();
    })
    .change(function(){
       $("#top_image_select_"+($(this).val())).show();
       $("#top_image_select_"+(3-$(this).val())).hide();
    });
});

$(function(){
  $('input[name="checkin_item[middle_image_select]"]:radio')
    .ready(function(){
      $("#middle_image_select_"+(3-$('input[name="checkin_item[middle_image_select]"]:checked').val())).hide();
    })
    .change(function(){
       $("#middle_image_select_"+($(this).val())).show();
       $("#middle_image_select_"+(3-$(this).val())).hide();
    });
});


$(function(){
  $('input[name="checkin_item[coupon_image_select]"]:radio')
    .ready(function(){
      $("#coupon_image_select_"+(3-$('input[name="checkin_item[coupon_image_select]"]:checked').val())).hide();
    })
    .change(function(){
       $("#coupon_image_select_"+($(this).val())).show();
       $("#coupon_image_select_"+(3-$(this).val())).hide();
    });
});

/*
 プレビュー表示処理
 プレビューの表示と、カラム更新時にプレビュー画面へ反映
*/
$(function(){
  $("input#title").change(function() { 
    $("#preview_place").contents().find("#title").html($(this).val());
    $("#preview_docheckin").contents().find("#title").html($(this).val());
  });
});

$(function(){ 
  $('input[name="checkin_item[top_image_select]"]:radio').change(function(){
    var display_img="";
    var display_txt="";
    switch($(this).val()){
      case "1":
        display_img="block";display_txt="none";break;
      case "2":          
        display_img="none";display_txt="block";break;
    }
    $("#preview_place").contents().find("#top_image").css("display",display_img); 
    $("#preview_place").contents().find("#top_image_text").css("display",display_txt);; 
  });
});
$(function(){
  $("input#top_image_text").change(function(){
    $("#preview_place").contents().find("#top_image_text").html($(this).val());
  });
});

$(function(){
  $('input[name="checkin_item[middle_image_select]"]:radio').change(function(){
    var display_img="";
    var display_txt="";
    switch($(this).val()){
      case "1":
        display_img="block";display_txt="none";break;
      case "2":          
        display_img="none";display_txt="block";break;
    }
    $("#preview_place").contents().find("#middle_image").css("display",display_img); 
    $("#preview_place").contents().find("#middle_image_text").css("display",display_txt);; 
  });
});
$(function(){
  $("input#middle_image_text").change(function(){
    $("#preview_place").contents().find("#middle_image_text").html($(this).val());
  });
});
$(function(){
  $("input#comment_title").change(function(){
    $("#preview_place").contents().find("#comment_title").html($(this).val());
  });
});
$(function(){
  $("input#coupon_image_text").change(function(){
    $("#preview_docheckin").contents().find("#coupon_image_text").html($(this).val());
  });
});
$(function(){
  $('input[name="checkin_item[coupon_image_select]"]:radio').change(function(){
    var display_img="";
    var display_txt="";
    switch($(this).val()){
      case "1":
        display_img="block";display_txt="none";break;
      case "2":          
        display_img="none";display_txt="block";break;
    }
    $("#preview_docheckin").contents().find("#coupon_image").css("display",display_img); 
    $("#preview_docheckin").contents().find("#coupon_image_text").css("display",display_txt);
  });
});
$(function(){
  $("input#comment_message").change(function(){
    $("#preview_docheckin").contents().find("#comment_message").html($(this).val());
  });
});
$(function(){
  $("input#wall_message").change(function(){
    $("#preview_facebook").contents().find("#wall_message").html($(this).val());
  });
});
$(function(){
  $("input#wall_name").change(function(){
    $("#preview_facebook").contents().find("#wall_name").html($(this).val());
  });
});
$(function(){
  $("input#wall_link").change(function(){
    $("#preview_facebook").contents().find("#wall_link").attr("href",res);
  });
});
$(function(){
  $("input#wall_caption").change(function(){
    $("#preview_facebook").contents().find("#wall_caption").html($(this).val());
  });
});
$(function(){
  $("input#wall_description").change(function(){
    $("#preview_facebook").contents().find("#wall_description").html($(this).val());
  });
});

// イメージプレビュー処理
$(function(){
  $("input#top_image").change(function(){ 
    var csrf_token = $("meta[name=csrf-token]").attr("content");
    var fbUserId = $("#fbUserId").attr("value")
    $(this).upload('/shop_admin/preview_upload_top_image',
      {'authenticity_token':csrf_token,'checkin_item[fbUserId]':fbUserId},
      function(res){
        $("#preview_place").contents().find("#top_image").attr("src",res);
      },'html');
  });
});
$(function(){
  $("#middle_image").change(function(){ 
    var csrf_token = $("meta[name=csrf-token]").attr("content");
    var fbUserId = $("#fbUserId").attr("value")
    $(this).upload('/shop_admin/preview_upload_middle_image',
    {'authenticity_token':csrf_token,'checkin_item[fbUserId]':fbUserId},
    function(res){
      $("#preview_place").contents().find("#middle_image").attr("src",res)
    },'html');
  }); 
});
$(function(){
  $('#coupon_image').change(function(){
    var csrf_token = $("meta[name=csrf-token]").attr("content");
    var fbUserId = $("#fbUserId").attr("value")
    $(this).upload('/shop_admin/preview_upload_coupon_image',
    {'authenticity_token':csrf_token,'checkin_item[fbUserId]':fbUserId},
    function(res){ 
      $("#preview_docheckin").contents().find("#coupon_image").attr("src",res)
      },'html');
  });
}); 
$(function(){
  $("input#wall_picture").change(function(){ 
    var csrf_token = $("meta[name=csrf-token]").attr("content");
    var fbUserId = $("#fbUserId").attr("value")
    $(this).upload('/shop_admin/preview_upload_wall_picture',
    {'authenticity_token':csrf_token,'checkin_item[fbUserId]':fbUserId},
    function(res){
      $("#preview_facebook").contents().find("#wall_picture").attr("src",res)
      } ,'html');
  });
});

/*
 アイテム編集画面 submit処理、未入力項目チェック
 chekin_item new/edit submit時フォーム入力チェック
*/
function new_checkin_item_submit() {

  var err = 0;
	var errhash=[];
  //チェックインプレイス未選択
  if($("#fbName").val()=="" || $("#fbName").hasClass("example")){
    //エラーメッセージ表示
    errhash["fbName"]="チェックインスポットを選択してください。";
		$("#error_noSelect").html("<span class='require' style='font-size:x-large'>※入力エラー：" + errhash["fbName"] + "※</span>");

    //スクロールをトップに戻す
    $('html,body').animate({ scrollTop: 0 }, 'fast');
		return false;

  }else{
		//submit処理
  	//exampleデータは全て削除
	  $(".example").each(function() {
		  $(this).val("");
 		});

		document.new_checkin_item.submit()
		return true;
  }
}


/*
  //お店の名前
  if($("#title").val()=="" || $("#title").hasClass("example")){
		errhash["item_name"]="お店の名前は必須です。";
    $("#title").wrap("<div id='title_error' class='field_with_errors'></div>")
    err=1;
  }else{
		$("#title_error").children().unwrap();
  }

  //お店の写真
  switch ($("#checkin_item_top_image_select").val()) {
		case "1":
	    if($("#top_image").val()=="" || $("#top_image").hasClass("example")){
				errhash["top_image"]="お店の写真は必須です。";
		    $("#top_image").wrap("<div id='top_image_error' class='field_with_errors'></div>")
  		  err=1;
  		}else{
				$("#top_image_error").children().unwrap();
  		}
			break;

		case "2":
	    if($("#top_image_text").val()=="" || $("#top_image_text").hasClass("example")){
				errhash["top_image_text"]="お店説明テキストは必須です。";
		    $("#top_image_text").wrap("<div id='top_image_text_error' class='field_with_errors'></div>")
  		  err=1;
  		}else{
				$("#top_image_text_error").children().unwrap();
  		}
			break;
  }
      
  //チェックインを促すメッセージ 
  if($("#comment_title").val()=="" || $("#comment_title").hasClass("example")){
		errhash["comment_title"]="チェックインを促すメッセージは必須です。";
    $("#comment_title").wrap("<div id='comment_title_error' class='field_with_errors'></div>")
    err=1;
  }else{
		$("#comment_title_error").children().unwrap();
  }

  //クーポン画像
  switch ($("#checkin_item_coupon_image_select").val()) {
		case "1":
	    if($("#coupon_image").val()=="" || $("#comment_title").hasClass("example")){
				errhash["coupon_image"]="クーポン画像は必須です。";
		    $("#coupon_image").wrap("<div id='coupon_image_error' class='field_with_errors'></div>")
  		  err=1;
  		}else{
				$("#coupon_image_error").children().unwrap();
  		}
			break;

		case "2":
	    if($("#coupon_image_text").val()=="" || $("#coupon_image_text").hasClass("example")){
				errhash["coupon_image_text"]="クーポンのテキストは必須です。";
		    $("#coupon_image_text").wrap("<div id='coupon_image_text_error' class='field_with_errors'></div>")
  		  err=1;
  		}else{
				$("#coupon_image_text_error").children().unwrap();
  		}
			break;
  }

  //チェックイン完了メッセージ
  if($("#comment_message").val()=="" || $("#comment_message").hasClass("example")){
		errhash["comment_message"]="チェックイン完了メッセージは必須です。";
    $("#comment_message").wrap("<div id='comment_message_error' class='field_with_errors'></div>")
    err=1;
  }else{
		$("#comment_message_error").children().unwrap();
  }

  //Facdebook Wall投稿
  if($("#checkin_item_post_wall_check").val() == "1"){
    if($("#wall_message").val()=="" || $("#wall_message").hasClass("example")){
			errhash["wall_message"]="FacebookWall メッセージは必須です。";
	    $("#wall_message").wrap("<div id='wall_message_error' class='field_with_errors'></div>")
	    err=1;
  	}else{
			$("#wall_message_error").children().unwrap();
  	}
    if($("#wall_name").val()=="" || $("#wall_name").hasClass("example")){
			errhash["wall_name"]="FacebookWall お店の名前は必須です。";
	    $("#wall_name").wrap("<div id='wall_name_error' class='field_with_errors'></div>")
	    err=1;
  	}else{
			$("#wall_name_error").children().unwrap();
  	}
    if($("#wall_caption").val()=="" || $("#wall_caption").hasClass("example")){
			errhash["wall_caption"]="FacebookWall 見出しは必須です。";
	    $("#wall_caption").wrap("<div id='wall_caption_error' class='field_with_errors'></div>")
	    err=1;
  	}else{
			$("#wall_caption_error").children().unwrap();
    }
    if($("#wall_description").val()=="" || $("#wall_description").hasClass("example")){
			errhash["wall_description"]="FacebookWall お店の紹介は必須です。";
	    $("#wall_description").wrap("<div id='wall_description_error' class='field_with_errors'></div>")
	    err=1;
  	}else{
			$("#wall_description_error").children().unwrap();
    }
  }
	
	if (err == 1) {
		var errcount=0;
		for(var i in errhash){
			errcount +=1;
		}

		html = "<div id='error_explanation'><h2>" + errcount + "つのエラーがあります。</h2>";
		html += "<ul>";
		for(var i in errhash){
			html += "<li>" + errhash[i] + "</li>";
		}
		html += "</ul></div>";

		$("#explanation").html(html)
    $('html,body').animate({ scrollTop: 0 }, 'fast');

		return false;
	}else{
		//submit処理

		//exampleデータは全て削除
	  $(".example").each(function() {
		  $(this).val("");
 		});

		document.new_checkin_item.submit()
		return true;
	}
}
*/


