class CreateMusicians < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
      t.string :name
      t.string :surname
      t.date :date_of_birth
      t.text :description

      t.timestamps null: false
    end
  end
end
