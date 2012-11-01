class AddIsDoctorToMen < ActiveRecord::Migration
  def change
    remove_column :men, :isDoctor,:boolean
    add_column :men, :isDoctor, :boolean , :default => false

  end
end
