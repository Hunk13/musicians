class AddUserIdToMusicians < ActiveRecord::Migration[4.2]
  def change
    add_column :musicians, :user_id, :integer
  end
end
