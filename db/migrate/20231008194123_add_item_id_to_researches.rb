class AddItemIdToResearches < ActiveRecord::Migration[7.0]
  def change
    add_column :researches, :item_id, :integer
  end
end
