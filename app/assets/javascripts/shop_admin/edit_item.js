//
// edit_item's event javascript
// プレビュー表示処理
//

// iframeの表示でスクロールしてしまうので、強制的に戻す。
$(function(){
  $(window).load(function() {
    $('html,body').animate({ scrollTop: 0 }, 'fast');
  });
});

// facebook place ローディング処理
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

// プレビュー表示処理
$(function(){
  $("input#title").change(function() { 
    $("#preview_place").contents().find("#title").html($(this).val());
    $("#preview_docheckin").contents().find("#title").html($(this).val());
  });
});
$(function(){ 
  $("select#checkin_item_top_image_select").change(function(){
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
  $("select#checkin_item_middle_image_select").change(function(){
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
  $("select#checkin_item_coupon_image_select").change(function(){
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


