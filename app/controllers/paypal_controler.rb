# coding: utf-8

class PaypalController < ApplicationController

  #paypalコールバック処理
  def paypal_notify
    Rails.logger.info("notify")
    Rails.logger.info(params)
  end

  #paypal購読完了処理
  def checkout
    Rails.logger.info("checkout")
    Rails.logger.info(params)
  end

  #paypal解約完了処理
  def cancel
    Rails.logger.info("cancel")
    Rails.logger.info(params)
  end

  #paypal処理完了処理
  def success
    respond_to do |format|
      format.html
      format.json
    end
  end


  #debug用　paypal購読完了処理
  def checkout_debug
    #productionモードでは無効にする
    return false if Rails.env == "production"

    #statusをAVAILABLEに更新
    checkin_item = CheckinItem.find_by_access_key(params[:access_key])
    checkin_item.status = CheckinItem::AVAILABLE
    checkin_item.start_date = Date.today
    checkin_item.payment_date = Date.today
    checkin_item.limit_date = Date.today << 12

    #支払いログの追加
    #payed_log = PayedLog.new(fbShopId)
  
    notice = checkin_item.save ? "checkout done" : "checkout NG"
    respond_to do |format|
      format.html { redirect_to :action=>'index', :notice=>notice }
    end
  end
   
  #debug用　paypal解約処理
  def cancel_debug
    #productionモードでは無効にする
    return false if Rails.env == "production"

    #statusをINVALIDに更新
    checkin_item = CheckinItem.find_by_access_key(params[:access_key])
    checkin_item.status = CheckinItem::LEAVE
    checkin_item.payment_date = nil
    checkin_item.limit_date = nil

    notice = checkin_item.save ? "cancel done" : "cancel NG"
    respond_to do |format|
      format.html { redirect_to :action=>'index', :notice=>notice }
    end
  end
  
end

