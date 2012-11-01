class AddHashedPasswordToMen < ActiveRecord::Migration
  def change
    add_column :men, :hashed_password, :string

  end
end
