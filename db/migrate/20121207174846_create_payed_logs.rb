class CreatePayedLogs < ActiveRecord::Migration
  def change
    create_table :payed_logs do |t|
      t.string :fbShopid
      t.datetime :payed_date

      t.timestamps
    end
  end
end
