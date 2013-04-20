# coding: utf-8

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

  def self.csv(access_key)
    require 'csv'
    header = ["ユーザーID","ユーザー名","日時"]
    # force_quotesオプションで全fieldにクオート強制される
    csv_data = CSV.generate("", {:encoding => 'sjis', :row_sep => "\r\n", :headers => header, :write_headers => true, :force_quotes => true}) do |csv|
      CheckinLog.where(:access_key=>access_key).each do |log|
        csv << [
          log.fbCheckinUserId,
          log.fbCheckinUserName,
          log.checkin_date
        ]
      end
    end
    csv_data.encode(Encoding::SJIS) # sjisに変換
  end
end
