# coding: utf-8

class AdminController < AdminApplicationController
  #ログイン認証用フィルタ
  before_filter :check_logined_Admin

  #Adminチェックフィルタ
  before_filter :check_admin


  #登録ショップ一覧
  def index
    @shops = Shop.all

    respond_to do |format|
      format.html
    end
  end

  def show_shop
    @shop = Shop.find_by_fbUserId(params[:fbUserId])

    respond_to do |format|
      format.html
    end

  end

  def edit_shop
    @shop = Shop.find_by_fbUserId(params[:fbUserId])

    respond_to do |format|
      format.html
    end
  end

  def update_shop
    @shop = Shop.find_by_fbUserId(params[:fbUserId])

    respond_to do |format|
      if @shop.update_attributes(params[:shop])
        format.html { redirect_to :action=>'index', notice: 'Shop was successfully updated.' }
      else
        format.html { render action: "edit_shop" }
      end
    end
    
  end

  def index_checkin_item
    #fbUserIdが指定されていたら、対象fbUserIdの一覧を出す
    if params.has_key?(:fbUserId)
      @checkin_items = CheckinItem.find_by_fbUserId(params[:fbUserId])
    else
      @checkin_items = CheckinItem.all
    end
    respond_to do |format|
      format.html
    end

  end

  def show_checkin_item
    @checkin_item = CheckinItem.find_by_access_key(params[:access_key])

    respond_to do |format|
      format.html
    end

  end

  def edit_checkin_item
    @checkin_item = CheckinItem.find_by_access_key(params[:access_key])

    respond_to do |format|
      format.html
    end
  end

  def update_checkin_item
    @checkin_item = CheckinItem.find_by_access_key(params[:access_key])

    respond_to do |format|
      if @checkin_item.update_attributes(params[:checkin_item])
        format.html { redirect_to :action=>'index', notice: 'CheckinItem was successfully updated.' }
      else
        format.html { render action: "edit_checkin_item" }
      end
    end

  end

=begin
  def new_checkin_item
    @checkin_item = CheckinItem.new

    respond_to do |format|
      format.html
    end

  end

  def create_checkin_item
    @checkin_item = CheckinItem.new(params[:checkin_item])

    respond_to do |format|
      if @checkin_item.save
        format.html { redirect_to :action=>'index', notice: 'Checkin item was successfully created.' }
      else
        format.html { render action: "new_checkin_item" }
      end
    end

  end
=end

  def index_checkin_log
    @checkin_logs = CheckinLog.all

    respond_to do |format|
      format.html
    end

  end
end
