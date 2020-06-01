class Article < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "authorid"
  has_many :votes, class_name: "Vote", foreign_key: "articleid"

end
