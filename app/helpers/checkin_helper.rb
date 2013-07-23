# coding: utf-8

module CheckinHelper

begin
  #
  #top_image 表示の際に画像かテキストかで出し分ける
  #
  def top_image_tag
    _image_tag("top")
  end
  def middle_image_tag
    _image_tag("middle")
  end
  def coupon_image_tag
    _image_tag("coupon")
  end

  #
  #top_image_tag,middle_image_tag,coupon_image_tagの共通処理
  #
  def _image_tag(pos)
    html=""

    case @checkin_item.send("#{pos}_image_select")
    #画像を使う
    when 1
      html  =<<EOT
      <%= image_tag(@checkin_item.send("get_#{pos}_image"), :style =>"width:100%; max-width:680px;",:id=>'#{pos}_image') %>
EOT

    #テキストを使う
    when 2
      html  =<<EOT
      <span class='tCenter' id='#{pos}_image_text' style='<%=display_txt(@checkin_item.send("#{pos}_image_select"))%>'>
      <%= @checkin_item.#{pos}_image_text.html_safe %>
      </span>
EOT

    end
    render :inline =>html
  end
end
end
