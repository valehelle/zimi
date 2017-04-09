class AddAuthorToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :author, :integer
  end
end
