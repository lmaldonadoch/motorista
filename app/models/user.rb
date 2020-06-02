class User < ApplicationRecord
  has_many :articles, class_name: "Article", foreign_key: "authorid"
  has_many :votes, class_name: "Vote", foreign_key: "userid"

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
  
end
