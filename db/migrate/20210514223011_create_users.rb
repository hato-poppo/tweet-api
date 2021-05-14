class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, comment: 'ユーザー名'
      t.string :account_name, null: false, comment: '表示名'
      t.string :password, comment: 'パスワード'
      t.string :email, null: false, comment: 'Eメールアドレス'
      t.boolean :is_deleted, null: false, default: 0, comment: '削除フラグ'
      t.datetime :created_at, default: -> { 'NOW()' }, comment: '登録日'
      t.datetime :updated_at, default: -> { 'NOW()' }, comment: '更新日'
    end
    add_index :users, :name, unique: true
    add_index :users, :email, unique: true
  end
end
