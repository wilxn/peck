class AddUsernameToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :username, :string

  end
end
