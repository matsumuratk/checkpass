# coding: utf-8
class Shop < ActiveRecord::Base
  has_many :checkin_items, :foreign_key=>'fbUserId', :primary_key=>'fbUserId', :validate=>true
  has_many :checkin_logs, :foreign_key => 'fbUserId', :primary_key => 'fbUserId'
  belongs_to :checkin_item, :foreign_key => 'fbUserId'
#  belongs_to :checkin_log

  attr_accessible :fbUserId       #登録者のFacebookID
  attr_accessible :fbShopId       #利用ショップのFaceBookID
  attr_accessible :fbName         #利用ショップのFaceBook名

=begin
  attr_accessible :status         #利用状況
                                  #  1:REGIST 利用登録完了
                                  #  3:PRE_AVAILABLE 無償利用期間 （初期支払いから1ヶ月）
                                  #  5:AVAILABLE 利用中
                                  #  6:LAST1MONTH 利用期限1ヶ月前～期限日
                                  #  8:INVALID 無効（支払い無し）
                                  #  9:LEAVE 退会
  attr_accessible :start_date     #利用開始日
  attr_accessible :payment_date   #支払いを完了した日
  attr_accessible :limit_date     #利用期限
=end

  attr_accessible :regist_datetime  #登録日時

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

=begin
  #status定数
  REGIST = 1
  PRE_AVAILABLE = 3
  AVAILABLE = 5
  LAST1MONTH = 6
  INVALID = 8
  LEAVE = 9

  #ステータスメッセージ
  def status_message
    case self.status
      when REGIST then message = "未登録"
      when PRE_AVAILABLE then message = "試用期間中"
      when AVAILABLE,LAST1MONTH then message = "利用中"
      when INVALID then message = "無効"
    end

    return message
  end

  #管理者用ステータスメッセージ
  def status_message_admin
    case self.status
      when REGIST then message = "未登録"
      when PRE_AVAILABLE then message = "試用期間中"
      when AVAILABLE then message = "利用中"
      when LAST1MONTH then message = "期限１ヶ月前"
      when INVALID then message = "無効"
      when LEAVE then message = "退会"
    end

    return message
  end

  #ステータス情報配列
  def status_arry_admin
    array = 
    [["未登録",REGIST],
     ["試用期間中",PRE_AVAILABLE],
     ["利用中",AVAILABLE],
     ["期限１ヶ月前",LAST1MONTH],
     ["無効",INVALID],
     ["退会",LEAVE]]

    return array
  end
=end

end
