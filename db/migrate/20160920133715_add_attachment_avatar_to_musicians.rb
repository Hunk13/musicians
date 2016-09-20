class AddAttachmentAvatarToMusicians < ActiveRecord::Migration
  def self.up
    change_table :musicians do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :musicians, :avatar
  end
end
