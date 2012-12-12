class CreatePsies < ActiveRecord::Migration
  def change
    create_table :psies do |t|
      t.integer :disease_id
      t.text :psycontent
    end
  end
end
