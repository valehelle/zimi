class RenameUserInUserpost < ActiveRecord::Migration[5.0]
  def change
     rename_column :user_posts, :user, :user_id
  end
end
