class AddEmailToMen < ActiveRecord::Migration
  def change
    add_column :men, :email, :string

  end
end
