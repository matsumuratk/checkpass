class CreateCheckinItems < ActiveRecord::Migration
  def change
    create_table :checkin_items do |t|
      t.string :access_key
      t.string :item_name
      t.datetime :create_datetime

      t.integer :status, {:default => 1}
      t.datetime :start_date
      t.datetime :payment_date
      t.date :limit_date
      t.datetime :cancel_date

      t.string :fbUserId
      t.string :fbShopId
      t.string :fbCheckinId
      t.string :fbName
      t.string :fbCategory
      t.string :fbCountry
      t.string :fbState
      t.string :fbCity
      t.string :fbStreet

      t.string :title
      t.binary :top_image
      t.string :top_image_text
      t.integer :top_image_select
      t.binary :middle_image
      t.string :middle_image_text
      t.integer :middle_image_select
      t.binary :coupon_image
      t.string :coupon_image_text
      t.integer :coupon_image_select
      t.string :comment_title
      t.string :comment_message
      t.boolean :post_wall_check,{:default => true}

      t.string :wall_name
      t.string :wall_link
      t.string :wall_caption
      t.string :wall_description
      t.binary :wall_picture
      t.string :wall_message

      t.timestamps
    end
  end
end
