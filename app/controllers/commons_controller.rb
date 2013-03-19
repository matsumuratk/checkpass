# coding: utf-8
class CommonsController < ApplicationController

  #ログイン認証用フィルタ
  skip_before_filter :check_logined

  #Facebookログインのコールバック処理
	#GET /commons/callback
	def callback
    mode = params[:mode]
    logger.debug "callback:mode=#{[mode]}"
    logger.debug "callback:oauth=#{session[mode.to_s+":"+:oauth.to_s]}"

		#get the access token from facebook with your code
		session[mode.to_s+":"+:access_token.to_s] = session[mode.to_s+":"+:oauth.to_s].get_access_token(params[:code])
    @graph = Koala::Facebook::GraphAPI.new(session[mode.to_s+":"+:access_token.to_s])
    #session[mode][:fbprofile] = @graph.get_object("/me")

    logger.debug "callback:access_token=#{session[mode.to_s+":"+:access_token.to_s]}"
    logger.debug "callback:redirect_to=#{session[mode.to_s+":"+:after_login_redirect_url.to_s]}"

		redirect_to session[mode.to_s+":"+:after_login_redirect_url.to_s]
	end


end

