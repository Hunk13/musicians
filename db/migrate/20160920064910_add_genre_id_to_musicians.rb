class AddGenreIdToMusicians < ActiveRecord::Migration
  def change
    add_column :musicians, :genre_id, :integer
  end
end
