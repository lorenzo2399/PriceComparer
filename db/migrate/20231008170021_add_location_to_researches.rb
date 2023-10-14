class AddLocationToResearches < ActiveRecord::Migration[7.0]
  def change
    add_column :researches, :location, :string
  end
end
