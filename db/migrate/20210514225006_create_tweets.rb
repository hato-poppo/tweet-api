class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.references :user, null: false, foreign_key: true, comment: '投稿者'
      t.string :content, null: false, comment: '投稿内容'
      t.datetime :created_at, default: -> { 'NOW()' }, comment: '登録日'
      t.datetime :updated_at, default: -> { 'NOW()' }, comment: '更新日'
    end
  end
end
