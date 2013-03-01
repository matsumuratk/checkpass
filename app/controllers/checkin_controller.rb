# coding: utf-8
require 'net/http'
require 'base64'
require 'cgi'

class CheckinController < CheckinApplicationController

	# GET /checkins/place/KdF0nu
  #チェックイン表示
  def place
    Rails.logger.debug("place :access_key = #{params[:access_key]}")

    @checkin_item = CheckinItem.find_by_access_key(params[:access_key])

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
    Rails.logger.debug("docheckin:access_key=#{flash[:access_key]}")
    
    begin
      #access_keyが無ければ、エラー
      #raise "no access_key error" if flash[:access_key].nil?
     
      fbCheckinPlace = FbCheckinPlace.new(@graph)
      #@checkin_item = CheckinItem.find_by_access_key(flash[:access_key])
      @checkin_item = CheckinItem.find_by_access_key(params[:checkin][:access_key])
      graph_place = fbCheckinPlace.search_by_fbid(@checkin_item.fbCheckinId).first

      #graph_placeが無ければ、エラー
      raise NoGraphPlaceException, "no place error" if graph_place.nil?

    rescue  => e
      #graph_placd無しの時はエラー画面表示
      Rails.logger.error("ERROR docheckin:params=#{params}")
      Rails.logger.error("ERROR docheckin:accesskey=#{params[:checkin][:access_key]}")
      Rails.logger.error("ERROR docheckin:#{e}")

      if e.class.name == "NoGraphPlaceException" || params[:checkin][:access_key].nil?
        respond_to do |format|
          format.html {render :action => :place_no_access_key, :notice => "no CheckinPlace" }
        end
      else
        #その他のエラーの場合は、place画面にリダイレクト
        redirect_to :controller => 'checkin',:action => 'place',:access_key=>params[:checkin][:access_key]
      end
      return
    end

    #チェックイン処理、ウォール書き込み処理
    begin
      #チェックイン
      graph_place.checkin(:message => params[:checkin][:message])
      graph_place.writeWall(@checkin_item)
      @checkin_item.setCheckinLog(@fbProfile)
    rescue => e
      #エラー処理
      Rails.logger.debug("docheckinエラー:#{e.message}")
      raise
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
    end
    respond_to do |format|
      format.html {render :template=>'checkin/place',:locals => {:preview => true}}
    end
  end

  #プレビュー画面 docheckin
  def preview_docheckin
    @checkin_item = CheckinItem.find_by_access_key(params[:access_key])
    respond_to do |format|
      format.html {render :template=>'checkin/docheckin',:locals => {:preview => true}}
    end
  end

  #プレビュー画面　Facebook投稿
  def preview_facebook  
    respond_to do |format|
      format.html 
    end
  end



end

class NoGraphPlaceException < Exception; end  #GraphPlaceなし
