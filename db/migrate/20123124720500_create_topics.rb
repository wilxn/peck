class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :body
      t.string :node_name
      t.integer :node_id
      t.integer :user_id
      t.string :who_delete

      t.datetime :replied_at
      t.integer :last_reply_id
      t.string :last_reply_user_login
      t.integer :last_reply_user_id
      t.integer :replies_count,:default => 0
      
      t.text :mentioned_user_ids
      t.text :liked_user_ids
      t.integer :likes_count,:default =>0
      t.text :follower_ids
      t.integer :message_id
      
      t.datetime :suggested_at
      t.timestamps
    end
      add_column :users,:created_at,:datetime
      add_column :users,:updated_at,:datetime
  end
end
