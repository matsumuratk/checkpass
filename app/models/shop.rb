# coding: utf-8
class Shop < ActiveRecord::Base
  has_many :checkin_items, :foreign_key=>'fbUserId', :primary_key=>'fbUserId', :validate=>true
  has_many :checkin_logs, :foreign_key => 'fbUserId', :primary_key => 'fbUserId'
  belongs_to :checkin_item, :foreign_key => 'fbUserId'

  attr_accessible :fbUserId       #登録者のFacebookID
  attr_accessible :fbShopId       #利用ショップのFaceBookID
  attr_accessible :fbName         #利用ショップのFaceBook名

  attr_accessible :regist_datetime  #登録日時
  attr_accessible :coupon_code    #登録クーポンコード
  attr_accessible :shop_name      #ショップ名
  attr_accessible :manager_name   #管理者名
  attr_accessible :manager_mail   #連絡先メールアドレス
  attr_accessible :manager_tel    #連絡先電話番号

  validates :fbUserId, :presence=>true, :uniqueness=>true
  validates :fbName, :presence=>true
  validates :shop_name, :presence=>true
  validates :manager_name, :presence=>{:message=>'は必須です。'}
  validates :manager_mail, :presence=>{:message=>'は必須です、またはメールアドレスのフォーマットではありません。'}, \
                           :format=>{:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, \
                                     :message => "email must be valid" }
  validates :manager_tel, :presence=>{:message=>'は必須です。'}

end
