/*
  jQuery button
*/
$(function() {
	$( ".link_button" )
	 	.button()
    .click(function( event ) {
    	event.preventDefault();
	});
});



/*
	セレクタで指定された範囲のlabelとinputをそろえる。
	一番長いラベルのサイズにあわせる
		呼び出し側：(※ <div id="pre_item">...</div>内を揃える場合
			$(document).ready(
				adjust_label("#pre_item");
		)
*/
function adjust_label(selector){
	sel = selector + " label";
	var max = 0; 
  $(sel).each(function(){ 
  	if ($(this).width() > max) 
      max = $(this).width(); 
  }); 
  $(sel).css("display", "inline-block"); 
  $(sel).width(max); 
}
