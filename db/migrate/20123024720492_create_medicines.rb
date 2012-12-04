class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name
      t.text :factory
      t.text :indtruction
      
      t.timestamps
    end
  end
end
