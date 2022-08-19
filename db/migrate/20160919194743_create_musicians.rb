class CreateMusicians < ActiveRecord::Migration[4.2]
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
