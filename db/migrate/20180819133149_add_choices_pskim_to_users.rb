class AddChoicesPskimToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :mobile, :string
    add_column :users, :address, :string
    add_column :users, :birthday, :date
    add_column :users, :profileimage, :string
  end
end
