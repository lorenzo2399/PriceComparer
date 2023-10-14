class AddUserIdToResearch < ActiveRecord::Migration[7.0]
  def change
    add_column :researches, :user_id, :integer
  end
end
