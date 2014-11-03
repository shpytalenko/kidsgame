class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :flash_size
      t.boolean :active

      t.timestamps
    end
  end
end
