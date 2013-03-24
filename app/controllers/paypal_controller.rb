# coding: utf-8

class PaypalController < ApplicationController

  #paypalコールバック処理
  def notify

##development debug code
params={"controller"=>"paypal", "action"=>"notify","txn_type"=>"subscr_signup", "subscr_id"=>"I-U3W9J558L1H0", "last_name"=>"\x8F\xBC\x91\xBA", "option_selection1"=>"", "residence_country"=>"JP", "mc_currency"=>"JPY", "item_name"=>"\x83`\x83F\x83b\x83N\x83p\x83X\x81@test", "business"=>"matsumuratk@yahoo.co.jp", "recurring"=>"1", "verify_sign"=>"ATasCS1Jl2VWHiyCH4RFZq70n7BIAS2u2BQTuSyUlmIOznUpJLEHcHDX", "payer_status"=>"unverified", "payer_email"=>"taku@matsmura.jp", "first_name"=>"\x91\xF1", "receiver_email"=>"matsumuratk@yahoo.co.jp", "payer_id"=>"RWTYZ5EDHXFJ6", "option_name1"=>"wpm1TP", "reattempt"=>"1", "item_number"=>"1234567", "subscr_date"=>"05:29:26 Mar 23, 2013 PDT", "btn_id"=>"59306892", "charset"=>"Shift_JIS", "notify_version"=>"3.7", "period1"=>"1 D", "mc_amount1"=>"0", "period3"=>"1 D", "mc_amount3"=>"1", "ipn_track_id"=>"73759ddd8db6e", "access_key"=>"hBlVlR"} if Rails.env.development?

  begin
    #PayedLogセット
    payedLog = PayedLog.new
    payedLog.fbUserid = params['fbUserid']
    payedLog.access_key = params['access_key']
    payedLog.subscr_id = params['subscr_id']
    payedLog.txn_type = params['txn_type']
    payedLog.payer_email = params['payer_email']
    payedLog.first_name = params['first_name'].encode("utf-8","sjis")
    payedLog.last_name = params['last_name'].encode("utf-8","sjis")
    payedLog.verify_sign = params['verify_sign']
    payedLog.ipn_track_id = params['ipn_track_id']
    payedLog.subscr_date = Time.parse(params['subscr_date']).in_time_zone("US/Pacific")
    payedLog.save!
Rails.logger.info("payerLog.save")      

    #notify処理
    checkin_item = CheckinItem.find_by_access_key(params['access_key'])
    raise "Checkin Item not found \'#{params['access_key']}\'" if checkin_item.nil?
    
Rails.logger.info("CheckinItem.find")      

    case params['txn_type']
    when "subscr_signup"   
      #登録処理
      ## LEAVEの状態なら、更新しない
        unless checkin_item.status == CheckinItem::LEAVE 
        #statusをAVAILABLEに更新
        checkin_item.status = CheckinItem::AVAILABLE
        checkin_item.start_date = Date.today
        checkin_item.payment_date = payedLog.subscr_date
        checkin_item.limit_date = Date.today << 12
Rails.logger.info("CheckinItem.save")      
        checkin_item.save!
Rails.logger.info("CheckinItem.save")      
      end
    when "subscr_cancel"
      #キャンセル処理
      #statusをLEAVEに更新
      checkin_item.status = CheckinItem::LEAVE
      checkin_item.cancel_date = payedLog.subscr_date
Rails.logger.info("CheckinItem.save")      
      checkin_item.save!
Rails.logger.info("CheckinItem.save")      
    else
      #その他の処理がきた場合
      Rails.logger.error("paypal#notify:想定外の処理")
      Rails.logger.error("paypal#notify:txn_type=#{params['txn_type']}")
      Rails.logger.error(params)      
    end

    render :text => "OK" 

  rescue => e
    Rails.logger.error("paypal#notify error:#{e}")
    render :text => "NG" 
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

