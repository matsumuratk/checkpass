class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :fbUserId
      t.string :fbShopId
      t.string :fbName
      t.datetime :regist_datetime
      t.string :shop_name
      t.string :manager_name
      t.string :manager_mail
      t.string :manager_tel

      t.timestamps
    end
  end
end
