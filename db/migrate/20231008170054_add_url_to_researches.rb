class AddUrlToResearches < ActiveRecord::Migration[7.0]
  def change
    add_column :researches, :url, :string
  end
end
