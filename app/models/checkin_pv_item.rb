# coding: utf-8
class CheckinPvItem < ActiveRecord::Base

  mount_uploader :top_image, TopImagePvUploader
  mount_uploader :middle_image, MiddleImagePvUploader
  mount_uploader :coupon_image, CouponImagePvUploader
  mount_uploader :wall_picture, WallPicturePvUploader

  attr_accessible :create_datetime  # アイテム作成日時
  attr_accessible :fbUserId         # 登録者FacebookID
  attr_accessible :top_image        # 画像１
  attr_accessible :middle_image     # 画像２
  attr_accessible :coupon_image     #クーポン画像１
  attr_accessible :wall_picture      #ウォール書き込み Picture

  #コールバック
  before_create do |record|
    record.create_datetime = Time.now.to_s(:db)
  end

end
