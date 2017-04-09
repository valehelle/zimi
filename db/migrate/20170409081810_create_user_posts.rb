class CreateUserPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :user_posts do |t|
      t.integer :user
      t.integer :post
      t.datetime :expiry

      t.timestamps
    end
  end
end
