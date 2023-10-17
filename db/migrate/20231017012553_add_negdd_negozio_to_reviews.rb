class AddNegddNegozioToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :negozio, :string
  end
end
