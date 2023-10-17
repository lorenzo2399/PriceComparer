class AddFavoriteCategoryToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :favorite_category, :string
  end
end
