# coding: utf-8
require 'net/http'
require 'base64'
require 'cgi'

class CheckinController < CheckinApplicationController

	# GET /checkins/place/KdF0nu
  #チェックイン表示
  def place
    Rails.logger.debug("place :access_key = #{params[:access_key]}")
    
    access_key = params[:access_key].presence || 'dummy'
    @checkin_item = CheckinItem.find_by_access_key(access_key)

    Rails.logger.debug("place :checkin_item = #{@checkin_item}")

    respond_to do |format|
      #キーが無ければ、キャンペーンなし。
      if @checkin_item.nil?
        Rails.logger.info("place:checkin_item.nil :access_key = #{params[:access_key]}")
        format.html {render :action => :place_no_access_key}
      else
         Rails.logger.debug("place:garph=#{@graph}")

        #Facebookユーザー情報取得
        begin
   	  	  user_profile = @graph.get_object("me")
        rescue =>e
          Rails.logger.debug("error=#{e.message}")
          raise
        end
        @user_name = user_profile['name']

        #アイテム有効性チェック
        Rails.logger.debug("place:status=#{@checkin_item.status}")
        case @checkin_item.status
        when CheckinItem::REGIST, CheckinItem::INVALID, CheckinItem::LEAVE
        #利用不可。キャンペーン終了を提示
        Rails.logger.debug("place:checkin_item.statusエラー :status = #{@checkin_item.status}")
          format.html {render :action => :place_end_campaign}

        when CheckinItem::PRE_AVAILABLE, CheckinItem::AVAILABLE, CheckinItem::LAST1MONTH
        #利用可 access_keyをflashで渡すようにする。
          format.html { flash[:access_key] = @checkin_item.access_key }
        end
      end
    end
  end

  def docheckin
    begin
      #access_keyが無ければ、エラー
      Rails.logger.debug(params)
      raise NoAccessKeyException,"no access_key error" unless params.key?(:checkin)
     
      fbCheckinPlace = FbCheckinPlace.new(@graph)
      @checkin_item = CheckinItem.find_by_access_key(params[:checkin][:access_key])
      graph_place = fbCheckinPlace.search_by_fbid(@checkin_item.fbCheckinId).first

      #graph_placeが無ければ、エラー
      raise NoGraphPlaceException, "no place error" if graph_place.nil?

    #access_keyなしエラー（直接アクセス、timeout等)
    rescue NoAccessKeyException => e
      Rails.logger.warn("WARNING docheckin:NoAccessKeyException ")
      respond_to do |format|
        format.html {render :action => :place_no_access_key, :notice => "no AccessKey" }
      end
      return  
    #graph placeなしエラー Facebookページ消失等。
    rescue NoGraphPlaceException => e
      Rails.logger.warn("WARNING docheckin:NoGraphPlaceException :access_key=#{params[:checkin][:access_key]}")
      respond_to do |format|
        format.html {render :action => :place_no_access_key, :notice => "no CheckinPlace" }
      end
      return
    #その他のエラー
    rescue  => e
      Rails.logger.error("ERROR docheckin:#{e}")

      #その他のエラーの場合は、place画面にリダイレクト access_keyがなければ、トップ
      redirect_to :controller => 'checkin',:action => 'place',:access_key=>params[:checkin][:access_key] if params.key?(:checkin)
      redirect_to "/"
      return
    end

    begin
      #チェックイン
      graph_place.checkin(:message => params[:checkin][:message])
      @checkin_item.setCheckinLog(@fbProfile)

      #ウォール書き込み
      if @checkin_item.post_wall_check == true
        graph_place.writeWall(@checkin_item)
      end

    rescue => e
      #エラー処理
      Rails.logger.error("docheckinエラー:#{e.message}")
    end
    
    respond_to do |format|
      format.html
    end

  end

  #プレビュー画面 place
  def preview_place
    unless params[:access_key].nil?
      @checkin_item = CheckinItem.find_by_access_key(params[:access_key]) 
    else
      @checkin_item = CheckinItem.new
      @checkin_item.setDummy
Rails.logger.debug("top_image:#{@checkin_item.top_image}")
    end
 
    respond_to do |format|
      format.html {render :template=>'checkin/place',:locals => {:preview => true}}
    end
  end

  #プレビュー画面 docheckin
  def preview_docheckin
    unless params[:access_key].nil?
      @checkin_item = CheckinItem.find_by_access_key(params[:access_key]) 
    else
      @checkin_item = CheckinItem.new
      @checkin_item.setDummy
    end
    respond_to do |format|
      format.html {render :template=>'checkin/docheckin',:locals => {:preview => true}}
    end
  end

  #プレビュー画面　Facebook投稿
  def preview_facebook  
    unless params[:access_key].nil?
      @checkin_item = CheckinItem.find_by_access_key(params[:access_key]) 
    else
      @checkin_item = CheckinItem.new
      @checkin_item.setDummy
    end
    respond_to do |format|
      format.html 
    end
  end

end

class NoGraphPlaceException < Exception; end  #GraphPlaceなし
class NoAccessKeyException < Exception; end   #AccessKeyなし

