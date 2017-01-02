class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  def clickbait
    bait = ["Won't Believe", "Secret", "Top ", "Guess"]

    if self.title.nil?
      errors.add(:title, "must be clickbait")
      return false
    end
    bait.each do |word|
      return true if self.title.include?(word)
    end
    errors.add(:title, "must be clickbait")
  end

end
