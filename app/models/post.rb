class Post < ActiveRecord::Base

validates :title, presence: true
 validates :content, length: { minimum: 250 }
 validates :summary, length: { maximum: 250 }
 validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
 validate :is_clickbait?

    CLICKBAIT_PATTERNS = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ]

    def is_clickbait?
      if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
        errors.add(:title, "must be clickbait")
      end
    end


end



# Post category is either Fiction or Non-Fiction This step requires an inclusion validator, which was not outlined in the README lesson. You'll need to refer to the Rails guide to look up how to use it.
