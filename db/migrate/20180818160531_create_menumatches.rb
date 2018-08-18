class CreateMenumatches < ActiveRecord::Migration[5.0]
  def change
    create_table :menumatches do |t|
      t.belongs_to :restaurant, foreign_key: true
      t.string :restaurant_name
      t.belongs_to :menu, foreign_key: true
      t.string :menu_name
      
      t.timestamps
    end
  end
end
