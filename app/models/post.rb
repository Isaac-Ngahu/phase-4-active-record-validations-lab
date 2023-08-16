class Post < ApplicationRecord
    validates :title,presence: true
    validates :content,length: {minimum:250}
    validates :summary,length: {maximum:250}
    validates :category,inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait_title


    def clickbait_title
        if title.present?
            clickbait_words = ["Won't Believe","Secret","Guess","Top"]
            unless clickbait_words.any?{|word| title.include?(word)}
                errors.add(:title,"Title not clickbait-y")
            end
        else
            "title not present"
        end
        
    end
end
