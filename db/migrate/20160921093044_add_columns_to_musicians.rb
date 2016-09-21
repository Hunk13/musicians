class AddColumnsToMusicians < ActiveRecord::Migration
  def change
    add_column :musicians, :biography, :text
    add_column :musicians, :discography, :text
    add_column :musicians, :awards, :text
  end
end
