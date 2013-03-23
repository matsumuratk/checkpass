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
  
  #登録／更新出力判別
  def submit_view(method)
    case method
    when "create_item";return "登録"
    when "update_item";return "更新"
    end
  end


  #paypalチェックアウトorキャンセル production/test/development表示わけ
  def paypal_checkout(checkin_item)
   
    #未登録,キャンセル状態－再登録
    case checkin_item.status
      when CheckinItem::REGIST,CheckinItem::INVALID,CheckinItem::LEAVE
        paypal_url = lambda{
          case Rails.env
            when "production","test";return PAYPAL::CHECKOUT_URL;
            when "development";return checkout_debug_paypal_path(checkin_item.access_key)
          end
        }.call()
        paypal_notify_url = PAYPAL::NOTIFY_URL+"/#{checkin_item.fbUserId}/#{checkin_item.access_key}"

        render :partial => 'paypal_checkout', :locals => {:paypal_url=>paypal_url,:paypal_notify_url=>paypal_notify_url,:access_key=>checkin_item.access_key}

      #利用中
      when CheckinItem::PRE_AVAILABLE,CheckinItem::AVAILABLE,CheckinItem::LAST1MONTH
        paypal_url = lambda{
          case Rails.env
            when "production","test";return PAYPAL::CANCEL_URL;
            when "development";return cancel_debug_paypal_path(checkin_item.access_key)
          end
        }.call()
        
        render :partial => 'paypal_cancel',:locals => {:paypal_url=>paypal_url, :access_key=>checkin_item.access_key}
    end      
  end
end

