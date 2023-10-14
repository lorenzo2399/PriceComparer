class AddPriceToResearches < ActiveRecord::Migration[7.0]
  def change
    add_column :researches, :price, :integer
  end
end
