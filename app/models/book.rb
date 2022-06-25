class Book < ApplicationRecord
    
    belongs_to :user
    
    
    validates :title, presence: true
    validates :body, presence: true , length: { maximum:200 }
    validates :category, presence: true
    
    def self.search(search_word)
        Book.where(['category LIKE ?', "#{search_word}"])
    end
    
end
