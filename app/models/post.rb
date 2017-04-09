class Post < ApplicationRecord
    has_many :user_post
    belongs_to :user, foreign_key: "author"
end
