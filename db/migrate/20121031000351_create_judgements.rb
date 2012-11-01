class CreateJudgements < ActiveRecord::Migration
  def change
    create_table :judgements do |t|
      t.integer :doctor_id
      t.integer :man_id
      t.text :content
      t.string :time_stamp

      t.timestamps
    end
  end
end
