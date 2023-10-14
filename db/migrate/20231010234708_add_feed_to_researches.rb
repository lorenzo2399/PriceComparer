class AddFeedToResearches < ActiveRecord::Migration[7.0]
  def change
    add_column :researches, :feed, :integer
  end
end
