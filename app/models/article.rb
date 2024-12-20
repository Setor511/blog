class Article < ApplicationRecord
    has_rich_text :body
  
    has_many :comments, dependent: :destroy
    belongs_to :user
  
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

    enum :publication_state, draft: 0, published: 1

  end