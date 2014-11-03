class AddAttachmentFlashToGames < ActiveRecord::Migration
  def self.up
    change_table :games do |t|
      t.attachment :flash
    end
  end

  def self.down
    remove_attachment :games, :flash
  end
end
