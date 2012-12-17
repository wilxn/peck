class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.integer :topics_count
      t.text :followers_ids
      t.string :name
      t.integer :section_id
      t.text :summary
      


      t.timestamps
    end
  end
end
