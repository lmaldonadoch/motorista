class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'authorid'
  has_many :votes, class_name: 'Vote', foreign_key: 'articleid'
  has_many :article_categories, foreign_key: 'articleid'
  has_many :categories, through: :article_categories, source: 'category'

  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 }
  validates :text, presence: true, length: { minimum: 100 }
  validates :image, presence: true

  def number_of_votes
    votes.count
  end

  def article_categories=(categories)
    categories.reject! { |category| category == '' }
  end
end
