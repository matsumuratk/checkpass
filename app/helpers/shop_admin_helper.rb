# coding: utf-8

module ShopAdminHelper
  #image/textセレクタ
  def display_img(sel)
    case sel
    when 1;return ""
    when 2;return "display:none"
    end
  end
  def display_txt(sel)
    case sel
    when 1;return "display:none"
    when 2;return ""
    end
  end
  
  #
  #チェックインアイテム新規登録／編集画面
  #サブミット項目の文字列を、新規登録／更新 で出しわける
  #
  def submit_view(method)
    case method
    when "create_item";return "新規登録"
    when "update_item";return "更　新"
    end
  end

  #
  #shop_admin/index
  #statusにあわせて、paypalチェックアウトorキャンセル production/test/development表示わけ
  #
  def paypal_checkout(checkin_item)
   
    #未登録,キャンセル状態－再登録
    case checkin_item.status
      when CheckinItem::REGIST,CheckinItem::INVALID
        paypal_url = lambda{
          case Rails.env
            when "production","test";return PAYPAL::CHECKOUT_URL;
            when "development";return checkout_debug_paypal_path(checkin_item.access_key)
          end
        }.call()  
        paypal_notify_url = PAYPAL::NOTIFY_URL+"/#{checkin_item.fbUserId}/#{checkin_item.access_key}"
        paypal_item_name = lambda{
          case Rails.env
            when "production";return "[チェックパス利用料]";
            when "test";return "[テスト：チェックパス利用料]";
          end
        }.call()
        render :partial => 'paypal_checkout', :locals => {:paypal_url=>paypal_url, :paypal_notify_url=>paypal_notify_url,:paypal_item_name=>paypal_item_name,:access_key=>checkin_item.access_key,:checkin_item=>checkin_item}

      #利用中
      when CheckinItem::PRE_AVAILABLE,CheckinItem::AVAILABLE,CheckinItem::LAST1MONTH
        paypal_url = lambda{
          case Rails.env
            when "production","test";return PAYPAL::CANCEL_URL;
            when "development";return cancel_debug_paypal_path(checkin_item.access_key)
          end
        }.call()
        
        render :partial => 'paypal_cancel',:locals => {:paypal_url=>paypal_url, :access_key=>checkin_item.access_key}

      #キャンセル状態
      when CheckinItem::LEAVE
        render :text=>"キャンセル済"

    end      
  end

  #searchList CheckinPlaceでない場合の選択
  def link_chekinPlace(place)
    unless place.latitude.nil?
      text = <<EOT
<%= link_to "選択", "#input_top", {:onclick=> "set_checkin_item('#{place.name}','#{place.category}','#{place.country}','#{place.state}','#{place.city}','#{place.street}','#{place.name}','#{place.id}','#{place.link}');return true;", :class=>"small awesome green"} %>
EOT

    else
      text = <<EOT
<span style="">選択できません</span>
EOT
    end
    
    render :inline =>text
  end

  #searchList CheckinPlaceでない場合のlink位置表示処理
  def noCheckinPlace(place)
    text = '<br/><span style="color:red">チェックインスポットとして登録されていません。</span>'
    render :inline =>text if place.latitude.nil?
  end
  
end


