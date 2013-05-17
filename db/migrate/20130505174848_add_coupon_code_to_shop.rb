class AddCouponCodeToShop < ActiveRecord::Migration
  def change
    add_column :shops, :coupon_code, :string
  end
end
