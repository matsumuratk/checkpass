# coding: utf-8

require 'net/http'
require 'base64'
require 'cgi'


class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :p3p_fix

  #3rdParty cookie対応
  def p3p_fix
   response.headers["P3P"] = 'CP="CAO PSA OUR"'
  end


  #Facebookログイン状況をチェックするフィルタ 共通処理
  ##mode :User ユーザー用、 :ShopAdmin 店舗用、 :Admin 管理者用 
  #Facebookログイン状況をチェックするフィルタ ユーザー用
  def _check_logined(mode)
    Rails.logger.debug "check_logined:session=#{session}"

    if session[:access_token].nil?
      _create_facebook_session mode
    else
      begin
        @graph = Koala::Facebook::GraphAPI.new(session[:access_token])
        session[:fbprofile] = @graph.get_object("me",{:locale=>"ja_JP"})
        @fbProfile = session[:fbprofile]
        @myFbUserId = session[:fbprofile]['id']        
      rescue =>e
        #セッションをクリアして再読み込み
        Rails.logger.debug "check_logined:rescue=#{e}\n"
        _create_facebook_session mode
      end
    end
  end


  #共通処理 Facebookセッションの作成
  def _create_facebook_session(mode)
Rails.logger.debug "_create_facebook_session:mode=#{mode}"
    session[:after_login_redirect_url] = request.url

    # generate a new oauth object with your app data and your callback url   
		session[:oauth] = Koala::Facebook::OAuth.new(Facebook::APP_ID[mode], Facebook::SECRET[mode], Facebook::CALLBACK_URL)

		# redirect to facebook to get your code
 	  redirect_to session[:oauth].url_for_oauth_code(:permissions => Facebook::PERMISSIONS[mode] )
 	  #:permissions => [:user_checkins,:publish_stream,:publish_checkins]
  end


end
