class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      ## ユーザーID
      t.integer :user_id, null: false
      ## タイトル
      t.string :title, null: false
      ## 内容
      t.text :content, null: false
      ## 郵便番号
      t.string :postal_code, null: false
      ## 住所
      t.string :address, null: false

      t.timestamps
    end
  end
end
