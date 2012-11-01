class AddManIdToDoctor < ActiveRecord::Migration
  def change
    remove_column :doctors, :man_id, :integer

  end
end
