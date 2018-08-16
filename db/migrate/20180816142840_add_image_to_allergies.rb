class AddImageToAllergies < ActiveRecord::Migration[5.0]
  def change
    add_column :allergies, :image, :string
  end
end
