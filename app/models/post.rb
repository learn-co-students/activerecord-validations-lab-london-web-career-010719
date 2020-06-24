class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates_inclusion_of :category, in: %w(Fiction Non-Fiction)
  validate :is_clickbait?

  CLICKBAIT_Y = [/Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
      ]

  def is_clickbait?
    if CLICKBAIT_Y.none? {|phrase| phrase.match title}
      errors.add(:title, "must be clickbait")
    end
  end

end
