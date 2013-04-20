# coding: utf-8
class CheckinItem < ActiveRecord::Base
  belongs_to :shop
  belongs_to :checkin_log
  has_many :checkin_logs, :primary_key => 'access_key', :foreign_key => 'access_key'
  has_one :shop, :primary_key => 'fbUserId', :foreign_key => 'fbUserId'

  short_access :access_key, :length => 6 #6桁のKey IDを生成

  mount_uploader :top_image, TopImageUploader
  mount_uploader :middle_image, MiddleImageUploader
  mount_uploader :coupon_image, CouponImageUploader
  mount_uploader :wall_picture, WallPictureUploader

  attr_accessible :access_key       # Key ID(6桁ハッシュ)
  attr_accessible :item_name        # アイテム管理用名称
  attr_accessible :create_datetime  # アイテム作成日時

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
  attr_accessible :cancel_date    #キャンセル日

  attr_accessible :fbUserId         # 登録者FacebookID
  attr_accessible :fbShopId         # CheckinItemを作成したショップID
  attr_accessible :fbCheckinId      # FaceBookのチェックインID
  attr_accessible :fbName           # FB登録名
  attr_accessible :fbCategory       # FBカテゴリ
  attr_accessible :fbCountry        # FBカントリー
  attr_accessible :fbState          # FB State
  attr_accessible :fbCity           # FB City
  attr_accessible :fbStreet         # FB Street

  attr_accessible :title            # タイトル（デフォルト：FB登録名）
  attr_accessible :top_image        # 画像１
  attr_accessible :top_image_text   # 画像１の文言
  attr_accessible :top_image_select # 画像1の使う方 1:画像 2:文言
  attr_accessible :middle_image     # 画像２
  attr_accessible :middle_image_text   # 画像２の文言
  attr_accessible :middle_image_select   # 画像２の使う方 1:画像 2:文言
  attr_accessible :coupon_image     #クーポン画像１
  attr_accessible :coupon_image_text     #クーポン画像１
  attr_accessible :coupon_image_select   #クーポン画像の使う方 1:画像 2:文言
  attr_accessible :comment_title    #文言１：チェックインコメントタイトル
  attr_accessible :comment_message   #文言２：完了メッセージ

  attr_accessible :post_wall_check   #ウォールに書き込むかチェック boolean
  attr_accessible :wall_message      #ウォール書き込み Message
  attr_accessible :wall_name         #ウォール書き込み Name
  attr_accessible :wall_link         #ウォール書き込み Link
  attr_accessible :wall_caption      #ウォール書き込み Caption
  attr_accessible :wall_description  #ウォール書き込み Description
  attr_accessible :wall_picture      #ウォール書き込み Picture


  #status定数
  REGIST = 1
  PRE_AVAILABLE = 3
  AVAILABLE = 5
  LAST1MONTH = 6
  INVALID = 8
  LEAVE = 9

  #コールバック
  before_create do |record|
    record.create_datetime = Time.now.to_s(:db)
  end

  #wall_picture 取得処理
  #wall_pictureが無ければ、coupon_iamageを返す
  def get_wall_picture
    return self.wall_picture.presence || self.coupon_image
  end


  #ステータスメッセージ
  def status_message
    case self.status
      when REGIST then message = "未登録"
      when PRE_AVAILABLE then message = "試用期間中"
      when AVAILABLE,LAST1MONTH then message = "利用中"
      when INVALID then message = "無効"
      when LEAVE then message = "終了"
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

  #FaceBookのPlace情報をセットする。
  def setFbPlace(shop,place)
    self.fbShopId = shop.fbShopId
    self.fbName =shop.fbName
    self.fbCategory = place.category
    self.fbCountry = place.country
    self.fbState = place.state
    self.fbCity = place.city
    self.fbStreet = place.street
  end

  #チェックインログを記録する
  def setCheckinLog(fbProfile)
    checkin_log = self.checkin_logs.build
    checkin_log.fbUserId = self.fbUserId
    checkin_log.fbShopId = self.fbShopId
    checkin_log.title = self.title
    checkin_log.fbCheckinUserId = fbProfile['id']
    checkin_log.fbCheckinUserName = fbProfile['name']
    checkin_log.checkin_date = Time.now

    unless checkin_log.save
      Rails.logger.error("setCheckinLog:#{checkin_log.errors}")
    end
  end

  #ダミーデータ作成（プレビュー用）
  def setDummy
      self.title = "[表示タイトル]"
      self.top_image = "/assets/sample_image1.gif"
      self.top_image_text = "[お店の紹介テキスト]"
      self.top_image_select = "2"
      self.middle_image = "/assets/sample_image2.gif"
      self.middle_image_text = '[メッセージ]'
      self.middle_image_select = "2"
      self.coupon_image = "/assets/sample_couponimage.gif"
      self.coupon_image_text = "[クーポンテキスト]"
      self.coupon_image_select = "2"
      self.comment_title = "[コメント]"
      self.comment_message = "[チェックイン完了メッセージ]"
      self.wall_name = "[お店の名前]"
      self.wall_link = "http://www.facebook.com/checkpass"
      self.wall_caption = "[見出し]"
      self.wall_description = "[お店の紹介]"
      self.wall_picture = "/assets/sample_coupon.gif"
      self.wall_message = "[メッセージ]"
  end
  
end
