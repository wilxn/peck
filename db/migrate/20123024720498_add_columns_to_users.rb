class AddColumensToUsers < ActiveRecord::Migration
  def change
      add_column :users,:login,:string
      add_column :users,:name, :string
      add_column :users,:location,:string
      add_column :users,:location_id,:int
      add_column :users,:company,:string
      add_column :users,:bio,:text
      add_column :users,:tagline,:text

      add_column :users,:verified,:boolean
      add_column :users,:state,:int
      add_column :users,:guest,:boolean
      add_column :users,:topics_count,:int
      add_column :users,:replies_count,:int
     
    end
  end
