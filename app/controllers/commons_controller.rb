# coding: utf-8
class CommonsController < ApplicationController

  #ログイン認証用フィルタ
  skip_before_filter :check_logined

  #Facebookログインのコールバック処理
	#GET /commons/callback
	def callback
logger.debug "callback"
logger.debug "callback:oauth=#{session[:oauth]}"

		#get the access token from facebook with your code
		session[:access_token] = session[:oauth].get_access_token(params[:code])
    @graph = Koala::Facebook::GraphAPI.new(session[:access_token])
    session[:fbprofile] = @graph.get_object("/me")

logger.debug "callback:access_token=#{session[:access_token]}"
logger.debug "callback:redirect_to=#{session[:after_login_redirect_url]}"

		redirect_to session[:after_login_redirect_url]
	end


end

