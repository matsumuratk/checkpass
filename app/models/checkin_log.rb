class CheckinLog < ActiveRecord::Base
#  belongs_to :shop
  belongs_to :checkin_item
  has_one :checkin_item, :primary_key => 'access_key', :foreign_key => 'access_key'
  has_one :shop, :primary_key => 'fbUserId', :foreign_key => 'fbUserId'

  attr_accessible :access_key        #CheckinItemのキーID
  attr_accessible :fbUserId          #チェックインしたアイテムのFacebookID
  attr_accessible :fbShopId          #チェックインしたショップのFacebookID
  attr_accessible :fbCheckinUserId   #チェックインしたユーザー
  attr_accessible :fbCheckinUserName #チェックインしたユーザー名
  attr_accessible :title             #CheckinItemのtitle
  attr_accessible :checkin_date      #チェックインした日時

end
