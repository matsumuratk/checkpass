# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#= require jquery
#= require jquery_ujs
#= require jquery.upload-1.0.2.min
#= require jquery.qrcode.min
#= require jquery.spin
#= require shop_admin/edit_item

###
#プレビュー表示処理
jQuery -> $("input#title").change -> 
 $("#preview_place").contents().find("#title").html($(@).val())
 $("#preview_docheckin").contents().find("#title").html($(@).val())
#jQuery -> $("input#top_image").change -> $("#preview_place").contents().find("#top_image").html($(@).val())
jQuery -> $("input#top_image_text").change -> $("#preview_place").contents().find("#top_image_text").html($(@).val()) 
jQuery -> $("input#top_image_select").change -> $("#preview_place").contents().find("#top_image_select").html($(@).val())
#jQuery -> $("input#middle_image").change -> $("#preview_place").contents().find("#middle_image").html($(@).val())
jQuery -> $("input#middle_image_text").change -> $("#preview_place").contents().find("#middle_image_text").html($(@).val())
jQuery -> $("input#middle_image_select").change -> $("#preview_place").contents().find("#middle_image_select").html($(@).val())
jQuery -> $("input#comment_title").change -> $("#preview_place").contents().find("#comment_title").html($(@).val())

#jQuery -> $("input#coupon_image").change -> $("#preview_docheckin").contents().find("#coupon_image").html($(@).val())
jQuery -> $("input#coupon_image_text").change -> $("#preview_docheckin").contents().find("#coupon_image_text").html($(@).val())
jQuery -> $("input#coupon_image_select").change -> $("#preview_docheckin").contents().find("#coupon_image_select").html($(@).val())

jQuery -> $("input#wall_message").change -> $("#preview_facebook").contents().find("#wall_message").html($(@).val())
jQuery -> $("input#wall_name").change -> $("#preview_facebook").contents().find("#wall_name").html($(@).val())
jQuery -> $("input#wall_link").change -> $("#preview_facebook").contents().find("#wall_link").html($(@).val())
jQuery -> $("input#:wall_caption").change -> $("#preview_facebook").contents().find("#wall_caption").html($(@).val())
jQuery -> $("input#wall_description").change -> $("#preview_facebook").contents().find("#wall_description").html($(@).val())
#jQuery -> $("input#wall_picture").change -> $("#preview_facebook").contents().find("#wall_picture").html($(@).val())

#イメージプレビュー処理
jQuery -> $("input#top_image").change -> 
 $(@).upload('/shop_admin/preview_upload_top_image',(res) ->
  $("#preview_facebook").contents().find("#top_image").attr("src",res) 
 ,'html')

jQuery -> $("#middle_image").change -> 
 $(@).upload('/shop_admin/preview_upload_top_image',(res) ->
  $("#preview_facebook").contents().find("#middle_image").attr("src",res)
 ,'html')

jQuery -> $('#coupon_image').change -> # $(@).upload('/shop_admin/preview_upload_top_image', ((res) -> $("#preview_facebook").contents().find("#coupon_image").attr("src",res)),'text')

jQuery -> $("input#wall_picture").change -> 
 $(@).upload('/shop_admin/preview_upload_top_image',(res) ->
  $("#preview_facebook").contents().find("#wall_picture").attr("src",res)
 ,'html')

###

