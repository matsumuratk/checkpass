class AddQrcodeToCheckinItem < ActiveRecord::Migration
  def change
    add_column :checkin_items, :qrcode, :binary
  end
end
