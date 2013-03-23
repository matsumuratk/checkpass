# coding: utf-8

class PaypalController < ApplicationController

  #paypalコールバック処理
  def notify
    #PayedLogセット
    payedLog = PayedLog.new
    payedLog.fbUserid = params[:fbUserid]
    payedLog.access_key = params[:access_key]
    payedLog.subscr_id = params[:subscr_id]
    payedLog.txn_type = params[:txn_type]
    payedLog.payer_email = params[:payer_email]
    payedLog.first_name = params[:first_name].encode("sjis","utf-8")
    payedLog.last_name = params[:last_name].encode("sjis","utf-8")
    payedLog.verify_sign = params[:verify_sign]
    payedLog.ipn_track_id = params[:ipn_track_id]
    payedLog.payer_date = params[:payer_date]
    payedLog.subscr_date = Time.parse(params[:subscr_date]).in_time_zone("PDT")
    payedLog.save!

    #notify処理
    checkin_item = CheckinItem.find_by_access_key(params[:access_key])

    case params[:txn_type]
    when "subscr_signup"   
      #登録処理
      #statusをAVAILABLEに更新
      checkin_item.status = CheckinItem::AVAILABLE
      checkin_item.start_date = Date.today
      checkin_item.payment_date = Date.today
      checkin_item.limit_date = Date.today << 12
    when "subscr_cancel"
      #キャンセル処理
      #statusをAVAILABLEに更新
      checkin_item.status = CheckinItem::LEAVE
      checkin_item.cancel_date = Date.today
    else
      #その他の処理がきた場合
      Rails.logger.info("paypal#notify:txn_type=#{params[:txn_type]}")
      Rails.logger.info(params)      
    end

    respond_to do |format|
      format.html { render :text => "OK" }
    end
  end

  #paypal購読完了処理
  def checkout
    Rails.logger.info("paypal_checkout:params=#{params}")
    respond_to do |format|
      format.html
      format.json
    end
  end

  #paypal処理完了処理
  def success
    Rails.logger.info("paypal_success:params=#{params}")
    respond_to do |format|
      format.html
      format.json
    end
  end

  #paypal解約完了処理
  def cancel
    Rails.logger.info("paypal_cancel:params=#{params}")
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
      format.html { redirect_to :controller=>'shop_admin', :action=>'index', :notice=>notice }
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
      format.html { redirect_to :controller=>'shop_admin', :action=>'index', :notice=>notice }
    end
  end
  
end

