function new_checkin_item_submit(){var e=[];return""==$("#fbName").val()||$("#fbName").hasClass("example")?(e.fbName="チェックインスポットを選択してください。",$("#error_noSelect").html("<span class='require' style='font-size:x-large'>※入力エラー："+e.fbName+"※</span>"),$("html,body").animate({scrollTop:0},"fast"),!1):($(".example").each(function(){$(this).val("")}),document.new_checkin_item.submit(),!0)}$(function(){$(window).load(function(){$("html,body").animate({scrollTop:0},"fast")})}),$(document).ready(function(){adjust_label("#facebook_item"),adjust_label("#fbwall_item_message")}),$(function(){$("#search_name_form").on("ajax:beforeSend",function(){$("#spin").spin()}).on("ajax:success",function(){$("#spin").spin(!1)}).on("ajax:error",function(){$("#spin").spin(!1)}).on("ajax:complete",function(){$("#spin").spin(!1)})}),$(function(){$(".search_ajax_spin").on("ajax:beforeSend",function(){$("#spin").spin()}).on("ajax:success",function(){$("#spin").spin(!1)}).on("ajax:error",function(){$("#spin").spin(!1)}).on("ajax:complete",function(){$("#spin").spin(!1)})}),$(function(){$('input[name="checkin_item[top_image_select]"]:radio').ready(function(){$("#top_image_select_"+(3-$('input[name="checkin_item[top_image_select]"]:radio').val())).hide()}).change(function(){$("#top_image_select_"+$(this).val()).show(),$("#top_image_select_"+(3-$(this).val())).hide()})}),$(function(){$('input[name="checkin_item[middle_image_select]"]:radio').ready(function(){$("#middle_image_select_"+(3-$('input[name="checkin_item[middle_image_select]"]:checked').val())).hide()}).change(function(){$("#middle_image_select_"+$(this).val()).show(),$("#middle_image_select_"+(3-$(this).val())).hide()})}),$(function(){$('input[name="checkin_item[coupon_image_select]"]:radio').ready(function(){$("#coupon_image_select_"+(3-$('input[name="checkin_item[coupon_image_select]"]:checked').val())).hide()}).change(function(){$("#coupon_image_select_"+$(this).val()).show(),$("#coupon_image_select_"+(3-$(this).val())).hide()})}),$(function(){$("input#title").change(function(){$("#preview_place").contents().find("#title").html($(this).val()),$("#preview_docheckin").contents().find("#title").html($(this).val())})}),$(function(){$('input[name="checkin_item[top_image_select]"]:radio').change(function(){var e="",t="";switch($(this).val()){case"1":e="block",t="none";break;case"2":e="none",t="block"}$("#preview_place").contents().find("#top_image").css("display",e),$("#preview_place").contents().find("#top_image_text").css("display",t)})}),$(function(){$("input#top_image_text").change(function(){$("#preview_place").contents().find("#top_image_text").html($(this).val())})}),$(function(){$('input[name="checkin_item[middle_image_select]"]:radio').change(function(){var e="",t="";switch($(this).val()){case"1":e="block",t="none";break;case"2":e="none",t="block"}$("#preview_place").contents().find("#middle_image").css("display",e),$("#preview_place").contents().find("#middle_image_text").css("display",t)})}),$(function(){$("input#middle_image_text").change(function(){$("#preview_place").contents().find("#middle_image_text").html($(this).val())})}),$(function(){$("input#comment_title").change(function(){$("#preview_place").contents().find("#comment_title").html($(this).val())})}),$(function(){$("input#coupon_image_text").change(function(){$("#preview_docheckin").contents().find("#coupon_image_text").html($(this).val())})}),$(function(){$('input[name="checkin_item[coupon_image_select]"]:radio').change(function(){var e="",t="";switch($(this).val()){case"1":e="block",t="none";break;case"2":e="none",t="block"}$("#preview_docheckin").contents().find("#coupon_image").css("display",e),$("#preview_docheckin").contents().find("#coupon_image_text").css("display",t)})}),$(function(){$("input#comment_message").change(function(){$("#preview_docheckin").contents().find("#comment_message").html($(this).val())})}),$(function(){$("input#wall_message").change(function(){$("#preview_facebook").contents().find("#wall_message").html($(this).val())})}),$(function(){$("input#wall_name").change(function(){$("#preview_facebook").contents().find("#wall_name").html($(this).val())})}),$(function(){$("input#wall_link").change(function(){$("#preview_facebook").contents().find("#wall_link").attr("href",res)})}),$(function(){$("input#wall_caption").change(function(){$("#preview_facebook").contents().find("#wall_caption").html($(this).val())})}),$(function(){$("input#wall_description").change(function(){$("#preview_facebook").contents().find("#wall_description").html($(this).val())})}),$(function(){$("input#top_image").change(function(){var e=$("meta[name=csrf-token]").attr("content"),t=$("#fbUserId").attr("value");$(this).upload("/shop_admin/preview_upload_top_image",{authenticity_token:e,"checkin_item[fbUserId]":t},function(e){$("#preview_place").contents().find("#top_image").attr("src",e)},"html")})}),$(function(){$("#middle_image").change(function(){var e=$("meta[name=csrf-token]").attr("content"),t=$("#fbUserId").attr("value");$(this).upload("/shop_admin/preview_upload_middle_image",{authenticity_token:e,"checkin_item[fbUserId]":t},function(e){$("#preview_place").contents().find("#middle_image").attr("src",e)},"html")})}),$(function(){$("#coupon_image").change(function(){var e=$("meta[name=csrf-token]").attr("content"),t=$("#fbUserId").attr("value");$(this).upload("/shop_admin/preview_upload_coupon_image",{authenticity_token:e,"checkin_item[fbUserId]":t},function(e){$("#preview_docheckin").contents().find("#coupon_image").attr("src",e)},"html")})}),$(function(){$("input#wall_picture").change(function(){var e=$("meta[name=csrf-token]").attr("content"),t=$("#fbUserId").attr("value");$(this).upload("/shop_admin/preview_upload_wall_picture",{authenticity_token:e,"checkin_item[fbUserId]":t},function(e){$("#preview_facebook").contents().find("#wall_picture").attr("src",e)},"html")})});