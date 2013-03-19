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
    if session[mode.to_s + ":" + :access_token.to_s].nil?
      _create_facebook_session mode
    else
      begin
        @graph = Koala::Facebook::GraphAPI.new(session[mode.to_s+":"+:access_token.to_s])
        Rails.logger.debug "check_logined:graph=#{@graph}"
#        session[mode][:fbprofile] = @graph.get_object("me",{:locale=>"ja_JP"})
#        @fbProfile = session[mode][:fbprofile]
        @fbProfile = @graph.get_object("me",{:locale=>"ja_JP"})
        @myFbUserId = @fbProfile['id']
        @myFbName = @fbProfile['name']
        Rails.logger.debug "check_logined:fbUserId=#{@myFbUserId}\n"
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
    session[mode.to_s+":"+:after_login_redirect_url.to_s] = request.url

    # generate a new oauth object with your app data and your callback url   
		session[mode.to_s+":"+:oauth.to_s] = Koala::Facebook::OAuth.new(Facebook::APP_ID[mode], Facebook::SECRET[mode], Facebook::CALLBACK_URL + "/#{mode}")

		# redirect to facebook to get your code
 	  redirect_to session[mode.to_s+":"+:oauth.to_s].url_for_oauth_code(:permissions => Facebook::PERMISSIONS[mode] )
  end

end
