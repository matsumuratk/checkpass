class PayedLog < ActiveRecord::Base
  attr_accessible :fbShopid
  attr_accessible :fbShopid
  attr_accessible :access_key
  attr_accessible :subscr_id
  attr_accessible :txn_type
  attr_accessible :payer_email
  attr_accessible :first_name
  attr_accessible :last_name
  attr_accessible :verify_sign
  attr_accessible :ipn_track_id
  attr_accessible :payer_date
  attr_accessible :subscr_date

end
