class CreateResearches < ActiveRecord::Migration[7.0]
  def change
    create_table :researches do |t|
      t.text :title

      t.timestamps
    end
  end
end
