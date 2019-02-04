class Post < ActiveRecord::Base
    validates :title, presence: true, uniqueness: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :title_must_be_clickbait

    def title_must_be_clickbait
      clickbait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      if clickbait.none? {|word| title.include? word if title}
        errors.add(:title, "must be clickbait")
      end
    end

end
