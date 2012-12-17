class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|

      t.text :body
      t.integer :user_id
      t.integer :topic_id
      t.text :mentiond_user_ids
      t.text :liked_user_ids
      t.text :likes_count
      t.integer :message_id


      t.timestamps
    end
  end
end
