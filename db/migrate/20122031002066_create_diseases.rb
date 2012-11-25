class CreateDiseases < ActiveRecord::Migration
  def change
    create_table :diseases do |t|
      t.string :name
      t.text :symp
      t.text :signal
      t.timestamps
    end
  end
end
