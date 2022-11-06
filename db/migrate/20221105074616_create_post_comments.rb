class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      ## 投稿ID
      t.integer :post_id, null: false
      ## ユーザーID
      t.integer :user_id, null: false
      ## コメント
      t.text :comment, null: false

      t.timestamps
    end
  end
end
