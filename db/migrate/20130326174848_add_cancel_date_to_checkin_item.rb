class AddCancelDateToCheckinItem < ActiveRecord::Migration
  def change
    add_column :checkin_items, :cancel_date, :datetime
  end
end
