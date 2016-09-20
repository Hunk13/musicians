class AddUserIdToMusicians < ActiveRecord::Migration
  def change
    add_column :musicians, :user_id, :integer
  end
end
