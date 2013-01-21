# coding: utf-8

class CheckinApplicationController < ApplicationController

  #ユーザー用ログイン認証用フィルタ
  before_filter :check_logined_User

  #レイアウト指定
  layout "checkin"

  #Facebookログイン状況をチェックするフィルタ ユーザー用
  def check_logined_User
    _check_logined :User
  end

end
