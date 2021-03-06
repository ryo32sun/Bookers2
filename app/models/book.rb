class Book < ApplicationRecord
    
    belongs_to :user
    has_many :book_tags, dependent: :destroy
    has_many :tags, through: :book_tags
    
    
    validates :title, presence: true
    validates :body, presence: true , length: { maximum:200 }

    def self.search(search_word)
        Book.where(['category LIKE ?', "#{search_word}"])
    end
    
end
