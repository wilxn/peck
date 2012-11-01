class AddSaltToMen < ActiveRecord::Migration
  def change
    add_column :men, :salt, :string
    add_column :men, :idcard, :string
    add_column :men, :real_name,:string
    add_column :doctors,:idcard,:string
    add_column :doctors,:skill,:string
    add_column :doctors,:introduction,:text
    add_column :doctors,:image_url,:string
  end
end
