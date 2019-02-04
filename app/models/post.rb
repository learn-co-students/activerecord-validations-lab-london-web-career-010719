class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in:["Fiction", "Non-Fiction"]}
  validate :non_clickbait

  def non_clickbait
    if title== nil
      return false
    elsif !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top") && !title.include?("Guess")
      errors.add(:title, "clickbait") && title != nil
      return false
    else
      return true
    end
  end
end
