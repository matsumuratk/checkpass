class AddPostWallCheckToCheckinItem < ActiveRecord::Migration
  def change
    add_column :checkin_items, :post_wall_check, :boolean, :default => true
  end
end
