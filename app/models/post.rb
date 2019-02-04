class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :validate_bait_title


  def validate_bait_title
    baity_words = ["Won't Believe", "Secret", "Top /\d+/", "Guess"]

    if baity_words.none? { |word| title.include?(word) if title }
      errors.add(:title, 'not clickbait enough bro')
    end
  end

end
