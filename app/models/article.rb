class Article < ApplicationRecord
    validates_presence_of :title

    has_rich_text :body 

    has_many :comments
end
