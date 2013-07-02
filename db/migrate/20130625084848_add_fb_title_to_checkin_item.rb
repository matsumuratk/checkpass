class AddFbTitleToCheckinItem < ActiveRecord::Migration
  def change
    add_column :checkin_items, :fbTitle, :string
  end
end
