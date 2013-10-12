class CreateUserLikeCodes < ActiveRecord::Migration
  def change
    create_table :user_like_codes do |t|
      t.integer :user_id
      t.integer :code_id

      t.timestamps
    end
    add_index :user_like_codes, :user_id
    add_index :user_like_codes, :code_id
  end
end
