class CreateMen < ActiveRecord::Migration
  def change
    create_table :men do |t|
      t.string :name
      t.string :id
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
  end
end
