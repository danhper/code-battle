class AddCacheCounterToCode < ActiveRecord::Migration
  def change
    add_column :codes, :likes_count, :integer, default: 0, null: false
    Code.update_all('likes_count = (
      SELECT COUNT("user_like_codes.id")
      FROM user_like_codes
      WHERE user_like_codes.code_id = codes.id
    )')
  end
end
