# coding: utf-8

class ShopAdminApplicationController < ApplicationController

  #店舗用ログイン認証用フィルタ
  before_filter :check_logined_ShopAdmin, :except => [:noregist, :regist, :paypal_notify,
        :preview_upload_top_image,
        :preview_upload_middle_image,
        :preview_upload_coupon_image,
        :preview_upload_wall_picture,
        :autherror   ]

  #registチェックフィルタ
  before_filter :check_regist, :except => [:noregist, :regist, :doregist, :paypal_notify,
        :preview_upload_top_image,
        :preview_upload_middle_image,
        :preview_upload_coupon_image,
        :preview_upload_wall_picture,
        :autherror   ]

  #レイアウト指定
  #layout "shop_admin"
  #layout "shop_admin_nohead", :only => [:noregist,:regist]

  #Facebookログイン状況をチェックするフィルタ 店舗用
  def check_logined_ShopAdmin
    _check_logined :ShopAdmin
  end

  #registチェックフィルタ
  def check_regist
    @myShop = Shop.find_by_fbUserId(@myFbUserId)  rescue nil

    Rails.logger.debug "check_regist:shop=#{@myShop}\n"
    Rails.logger.debug "check_regist:@myFbUserId=#{@myFbUserId}\n"

    #shopレコード無しなら、登録画面を表示
    if @myShop.nil?
      redirect_to :controller => 'shop_admin',:action => 'regist'
    end
  end
end
