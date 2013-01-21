class CreateAdminMasters < ActiveRecord::Migration
  def change
    create_table :admin_masters do |t|
      t.string :master_id

      t.timestamps
    end
  end
end
