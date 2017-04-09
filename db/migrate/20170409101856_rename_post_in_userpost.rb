class RenamePostInUserpost < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_posts, :post, :post_id
  end
end
