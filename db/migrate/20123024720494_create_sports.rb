class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.integer :disease_id
      t.text :sportcontent
    end
  end
end
