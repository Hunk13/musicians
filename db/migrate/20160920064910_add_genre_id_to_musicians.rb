class AddGenreIdToMusicians < ActiveRecord::Migration[4.2]
  def change
    add_column :musicians, :genre_id, :integer
  end
end
