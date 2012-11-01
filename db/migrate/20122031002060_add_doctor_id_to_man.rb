class AddDoctorIdToMan < ActiveRecord::Migration
  def change
    add_column :men, :doctor_id, :integer

  end
end
