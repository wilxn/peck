class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :disease_id
      t.text :foodcontent
    end
  end
end
