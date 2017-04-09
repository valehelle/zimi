class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :text
      t.string :emotion
      t.string :location
      t.string :reply

      t.timestamps
    end
  end
end
