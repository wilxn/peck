class AddIsDoctorToMen < ActiveRecord::Migration
  def change
    add_column :men, :isDoctor, :boolean , :default => false

  end
end
