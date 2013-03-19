# coding: utf-8

class ShopAdminController < ShopAdminApplicationController

  ## 店舗機能
  #初期画面
  def noregist
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @checkin_items }
    end
  end

  #情報登録画面
  def regist
    @shop = Shop.new
    @shop.fbUserId = @myFbUserId
    #@shop.shop_name = session[:fbprofile]['name']
    @shop.shop_name = @myFbName

    respond_to do |format|
      format.html 
    end

  end

  #情報登録
  def doregist
    @shop = Shop.new(params[:shop])
    @shop.fbUserId = @myFbUserId
    #@shop.fbName = session[:fbprofile]['name']
    @shop.fbName = @myFbName
    @shop.regist_datetime = Time.now.to_s(:db)

    respond_to do |format|
      if @shop.save 
        format.html { redirect_to :action => "index" }
      else
        Rails.logger.error("doregist:shop.sava is false.") 
        Rails.logger.error @shop.errors.full_messages.join("\n")

        format.html { render action: "regist"}
      end
    end
    
  end

  #トップ画面
  def index
    @shop = @myShop
    @checkin_url = Facebook::CHECKIN_URL


    respond_to do |format|
      format.html { render action: params[:render] }
      format.json { render json: @shop}
    end

  end

  #管理者情報更新画面
  def edit_manager
    @shop = @myShop

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shop}
    end

  end

  #管理者情報更新
  def update_manager
    @shop = @myShop

    respond_to do |format|
      if @shop.update_attributes(params[:shop])
        format.html { redirect_to :action=>'index', notice: 'Shop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit_manager" }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end

  end

  #チェックインアイテム新規作成
  def new_item
    @checkin_item = CheckinItem.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @checkin_item}
    end
  end

  #チェックインアイテム新規作成
  def create_item
    @checkin_item = @myShop.checkin_items.build(params[:checkin_item])

  respond_to do |format|
    if @checkin_item.save
        format.html { redirect_to :action => 'index', notice: 'CheckinItem was successfully created.' }
        format.json { render json: @checkin_item, status: :created, location: @shop_admin }
      else
        Rails.logger.error("create_item:checkin_item.sava is false.") 
        Rails.logger.error @checkin_item.errors.full_messages.join("\n")
        format.html { render action: "new_item" }
        format.json { render json: @checkin_item.errors, status: :unprocessable_entity }
      end
    end

  end

  #チェックインアイテム情報編集
  def edit_item
    @checkin_item = @myShop.checkin_items.find_by_access_key(params[:access_key])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @checkin_item}
    end

  end

  #チェックインアイテム情報更新
  def update_item
    @checkin_item = @myShop.checkin_items.find_by_access_key(params[:access_key])

    respond_to do |format|
      if @checkin_item.update_attributes(params[:checkin_item])
        format.html { redirect_to  :action => 'index', notice: 'CheckinItem was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  #チェックインアイテム削除
  def destroy_item
    @checkin_item = @myShop.checkin_items.find_by_access_key(params[:access_key])
    @checkin_item.destroy

    respond_to do |format|
      format.html { redirect_to shop_admin_url }
      format.json { head :no_content }
    end

  end

  #paypalコールバック処理
  def paypal_notify
    Rails.logger.info(params)
    @paras = params
    respond_to do |format|
      format.html 
    end
  end

  #paypal購読完了処理
  def paypal_checkout
    Rails.logger.info(params)
    @paras = params
    respond_to do |format|
      format.html { render action: "paypal_notify" }
    end
  end

  #paypal解約完了処理
  def paypal_cancel
    Rails.logger.info(params)
    @paras = params
    respond_to do |format|
      format.html { render action: "paypal_notify" }
    end
  end

  #debug用　paypal購読完了処理
  def paypal_checkout_debug
    #productionモードでは無効にする
    return false if Rails.env == "production"

    #statusをAVAILABLEに更新
    checkin_item = @myShop.checkin_items.find_by_access_key(params[:access_key])
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
  def paypal_cancel_debug
    #productionモードでは無効にする
    return false if Rails.env == "production"

    #statusをINVALIDに更新
    checkin_item = @myShop.checkin_items.find_by_access_key(params[:access_key])
    checkin_item.status = CheckinItem::LEAVE
    checkin_item.payment_date = nil
    checkin_item.limit_date = nil

    notice = checkin_item.save ? "cancel done" : "cancel NG"
    respond_to do |format|
      format.html { redirect_to :action=>'index', :notice=>notice }
    end
  end
  
  #AJAX search
  #placeの検索
  def search
    @checkin_item = CheckinItem.new
    searchWord = params[:name].nil? ? "" : params[:name]
    begin
      fbCheckinPlace = FbCheckinPlace.new(@graph)
      @places = fbCheckinPlace.search(searchWord)
    rescue =>e
      Rails.logger.debug("search:rescue = #{e}")
      @error=e
    end

    respond_to do |format|
      format.js { render :layout => false }
    end

  end

  #placeの検索 Fbidで
  def search_by_fbid
    @checkin_item = CheckinItem.new
    id = params[:id].nil? ? "" : params[:id]
    begin
      fbCheckinPlace = FbCheckinPlace.new(@graph)
      @places = fbCheckinPlace.search_by_fbid(id)
Rails.logger.debug("search_by_fbid:@places=#{@places}")
    rescue =>e
      Rails.logger.debug("search_by_fbid:rescue = #{e}")
      @error=e
    end

    respond_to do |format|
      format.js { render :layout => false }
    end
  end
  
  #Ajax プレビュー画像アップロード
  def preview_upload_top_image
    _preview_upload_image(params[:checkin_item],"top_image")
  end
  def preview_upload_middle_image
    _preview_upload_image(params[:checkin_item],"middle_image")
  end
  def preview_upload_coupon_image
    _preview_upload_image(params[:checkin_item],"coupon_image")
  end
  def preview_upload_wall_picture
    _preview_upload_image(params[:checkin_item],"wall_picture")
  end
  def _preview_upload_image(item,method)
    checkin_pv_item = CheckinPvItem.where(:fbUserId => item[:fbUserId]).first_or_create
    if checkin_pv_item.update_attributes(item)
      Rails.logger.debug("_preview_upload:method=#{method}")
      Rails.logger.debug("_preview_upload:url=#{checkin_pv_item.send(method)}")
      render :text => checkin_pv_item.send(method)
    else
      render :text => "NG"
    end
  end
end
