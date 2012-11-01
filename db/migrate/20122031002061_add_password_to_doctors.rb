class AddPasswordToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :hashed_password, :string
    add_column :doctors,:salt,:string

  end
end
