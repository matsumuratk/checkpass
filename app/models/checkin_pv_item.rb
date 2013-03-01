# coding: utf-8
class CheckinPvItem < ActiveRecord::Base

  mount_uploader :top_image, TopImagePVUploader
  mount_uploader :middle_image, MiddleImagePVUploader
  mount_uploader :coupon_image, CouponImagePVUploader
  mount_uploader :wall_picture, WallPicturePVUploader

  attr_accessible :access_key       # Key ID　=> fbUserIdを使う
  attr_accessible :item_name        # アイテム管理用名称
  attr_accessible :create_datetime  # アイテム作成日時

  #attr_accessible :status         #利用状況
                                  #  1:REGIST 利用登録完了
                                  #  3:PRE_AVAILABLE 無償利用期間 （初期支払いから1ヶ月）
                                  #  5:AVAILABLE 利用中
                                  #  6:LAST1MONTH 利用期限1ヶ月前～期限日
                                  #  8:INVALID 無効（支払い無し）
                                  #  9:LEAVE 退会
  #attr_accessible :start_date     #利用開始日
  #attr_accessible :payment_date   #支払いを完了した日
  #attr_accessible :limit_date     #利用期限

  #attr_accessible :fbUserId         # 登録者FacebookID
  #attr_accessible :fbShopId         # CheckinItemを作成したショップID
  attr_accessible :fbCheckinId      # FaceBookのチェックインID
  #attr_accessible :fbName           # FB登録名
  #attr_accessible :fbCategory       # FBカテゴリ
  #attr_accessible :fbCountry        # FBカントリー
  #attr_accessible :fbState          # FB State
  #attr_accessible :fbCity           # FB City
  #attr_accessible :fbStreet         # FB Street

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

  attr_accessible :wall_message      #ウォール書き込み Message
  attr_accessible :wall_name         #ウォール書き込み Name
  attr_accessible :wall_link         #ウォール書き込み Link
  attr_accessible :wall_caption      #ウォール書き込み Caption
  attr_accessible :wall_description  #ウォール書き込み Description
  attr_accessible :wall_picture      #ウォール書き込み Picture

end
