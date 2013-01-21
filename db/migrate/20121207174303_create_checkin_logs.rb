class CreateCheckinLogs < ActiveRecord::Migration
  def change
    create_table :checkin_logs do |t|
      t.string :fbUserId
      t.string :fbShopId
      t.string :fbCheckinUserId
      t.string :fbCheckinUserName
      t.string :access_key
      t.string :title
      t.datetime :checkin_date

      t.timestamps
    end
  end
end
