class CreateInforms < ActiveRecord::Migration
  def change
    create_table :informs do |t|
      t.text :content
      t.string :date

      t.timestamps
    end
  end
end
