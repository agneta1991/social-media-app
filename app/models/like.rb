class Like < ApplicationRecord
    belongs_to :post, class_name: 'Post', foreign_key: 'author_id'
end
