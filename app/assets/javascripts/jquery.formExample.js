/*
  入力フォームで入力例を表示する。
*/

$(function() {
	$(":text").css('color', '#999');
  var input_val = [];
  $(":text").each(function() {
	  input_val.push($(this).val());
  });
  $(":text").focus(function() {
	  var chk_num = $(":text").index(this);
    var chk_val = $(":text").eq(chk_num).val();
    if(chk_val == input_val[chk_num]) {
	    var def_val = $(this).val();
      $(this).val('');
			$(this).removeClass("example");
      $(this).css('color', '#333');
      $(this).blur(function() {
	      if($(this).val() == '') {
		      $(this).val(def_val);
					$(this).addClass("example");
    	    $(this).css('color', '#999');
      	}
    	});
  	}
	});
});


