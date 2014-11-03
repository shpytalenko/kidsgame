class AddFlashWidthToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :flash_width, :integer
  end
end
