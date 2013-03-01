# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#jQuery -> $("input#item_name").change -> $("#preview_place").contents().find("#item_name").html($(@).val())
#jQuery -> $("input#fbName").change -> $("#preview_place").contents().find("#fbName").html($(@).val())
#jQuery -> $("input#fbCategory").change -> $("#preview_place").contents().find("#fbCategory").html($(@).val())
#jQuery -> $("input#fbCountry").change -> $("#preview_place").contents().find("#fbCountry").html($(@).val())
#jQuery -> $("input#fbState").change -> $("#preview_place").contents().find("#fbState").html($(@).val())
#jQuery -> $("input#fbCity").change -> $("#preview_place").contents().find("#fbCity").html($(@).val())
#jQuery -> $("input#fbStreet").change -> $("#preview_place").contents().find("#fbStreet").html($(@).val())
#jQuery -> $("input#fbCheckinId").change -> $("#preview_place").contents().find("#fbCheckinId").html($(@).val())

jQuery -> $("input#title").change -> 
 $("#preview_place").contents().find("#title").html($(@).val())
 $("#preview_docheckin").contents().find("#title").html($(@).val())
jQuery -> $("input#top_image").change -> $("#preview_place").contents().find("#top_image").html($(@).val())
jQuery -> $("input#top_image_text").change -> $("#preview_place").contents().find("#top_image_text").html($(@).val())
jQuery -> $("input#top_image_select").change -> $("#preview_place").contents().find("#top_image_select").html($(@).val())
jQuery -> $("input#middle_image").change -> $("#preview_place").contents().find("#middle_image").html($(@).val())
jQuery -> $("input#middle_image_text").change -> $("#preview_place").contents().find("#middle_image_text").html($(@).val())
jQuery -> $("input#middle_image_select").change -> $("#preview_place").contents().find("#middle_image_select").html($(@).val())
jQuery -> $("input#comment_title").change -> $("#preview_place").contents().find("#comment_title").html($(@).val())

jQuery -> $("input#coupon_image").change -> $("#preview_docheckin").contents().find("#coupon_image").html($(@).val())
jQuery -> $("input#coupon_image_text").change -> $("#preview_docheckin").contents().find("#coupon_image_text").html($(@).val())
jQuery -> $("input#coupon_image_select").change -> $("#preview_docheckin").contents().find("#coupon_image_select").html($(@).val())

jQuery -> $("input#wall_message").change -> $("#preview_facebook").contents().find("#wall_message").html($(@).val())
jQuery -> $("input#wall_name").change -> $("#preview_facebook").contents().find("#wall_name").html($(@).val())
jQuery -> $("input#wall_link").change -> $("#preview_facebook").contents().find("#wall_link").html($(@).val())
jQuery -> $("input#:wall_caption").change -> $("#preview_facebook").contents().find("#wall_caption").html($(@).val())
jQuery -> $("input#wall_description").change -> $("#preview_facebook").contents().find("#wall_description").html($(@).val())
jQuery -> $("input#wall_picture").change -> $("#preview_facebook").contents().find("#wall_picture").html($(@).val())


