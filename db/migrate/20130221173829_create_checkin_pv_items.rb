class CreateCheckinPvItems < ActiveRecord::Migration
  def change
    create_table :checkin_pv_items do |t|
      t.datetime :create_datetime

      t.string :fbUserId
      t.binary :top_image
      t.binary :middle_image
      t.binary :coupon_image
      t.binary :wall_picture

      t.timestamps
    end
  end
end
