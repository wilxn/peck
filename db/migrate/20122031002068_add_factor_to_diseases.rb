class AddFactorToDiseases < ActiveRecord::Migration
  def change
    add_column :diseases,:defi,:text
    add_column :diseases,:factor,:text
    add_column :diseases,:divi,:text
    
  end
end
