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
    case checkin_item.status
    when CheckinItem::REGIST #未登録
      case Rails.env
      when "production";render :partial => 'paypal_checkout_production', :locals => {:checkin_item=>checkin_item}
      when "test";render :partial => 'paypal_checkout_test', :locals => {:checkin_item=>checkin_item}
      when "development";render :partial => 'paypal_checkout_development', :locals => {:checkin_item=>checkin_item}
      else
        Rails.logger.error("Rails.env=#{Rails.env}")
        "<div>paypal checkout error</div>"
      end
    when CheckinItem::PRE_AVAILABLE,CheckinItem::AVAILABLE,CheckinItem::LAST1MONTH #利用中
      case Rails.env
      when "production";render :partial => 'paypal_cancel_production',:locals => {:checkin_item=>checkin_item}
      when "test";render :partial => 'paypal_cancel_test',:locals => {:checkin_item=>checkin_item}
      when "development";render :partial => 'paypal_cancel_development',:locals => {:checkin_item=>checkin_item}
      else
        Rails.logger.error("Rails.env=#{Rails.env}")
        "<div>paypal checkout error</div>"
      end

    when CheckinItem::INVALID,CheckinItem::LEAVE #キャンセル状態－再登録
      case Rails.env
      when "production";render :partial => 'paypal_checkout_production', :locals => {:checkin_item=>checkin_item}
      when "test";render :partial => 'paypal_checkout_test', :locals => {:checkin_item=>checkin_item}
      when "development";render :partial => 'paypal_checkout_development', :locals => {:checkin_item=>checkin_item}
      else
        Rails.logger.error("Rails.env=#{Rails.env}")
        "<div>paypal checkout error</div>"
      end

    end
  end
end
