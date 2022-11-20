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
      # ## 都道府県
      # t.string :prefecture_code, null: false
      # t.string :city, null: false
      # t.string :street, null: false
      # t.string :other_address # 番地以降の住所がない場合もあるため、null: falseはつけない

      t.timestamps
    end
  end
end
