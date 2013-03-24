class CreatePayedLogs < ActiveRecord::Migration
  def change
    create_table :payed_logs do |t|
      t.string :fbUserId
      t.string :access_key
      t.string :subscr_id
      t.string :txn_type
      t.string :payer_email
      t.string :first_name
      t.string :last_name
      t.string :verify_sign
      t.string :ipn_track_id
      t.string :payer_date
      t.datetime :subscr_date

      t.timestamps
    end
  end
end
