class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :fbUserId
      t.string :fbShopId
      t.string :fbName

#      t.integer :status, {:default => 1}
#      t.date :start_date
#      t.date :payment_date
#      t.date :limit_date
      t.datetime :regist_datetime
      t.string :shop_name
      t.string :manager_name
      t.string :manager_mail
      t.string :manager_tel

      t.timestamps
    end
  end
end
