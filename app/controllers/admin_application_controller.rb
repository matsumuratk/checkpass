# coding: utf-8

class AdminApplicationController < ApplicationController

  #Facebookログイン状況をチェックするフィルタ 店舗用
  def check_logined_Admin
    _check_logined :Admin
  end

  #レイアウト指定
  layout "admin"

  #Admin権限者かのチェック
  def check_admin
    Rails.logger.debug("check_admin:@myFbUserId=#{@myFbUserId}")
    admin = AdminMaster.find_by_master_id(@myFbUserId)
    
    #adminがnilなら、Administratorではない
#    redirect_to :action => :noadmin if admin.nil?
    if admin.nil?
      respond_to do |format|
        format.html {render :action => :noadmin}
      end
    end
  end

end
