class Vote < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "userid"
  belongs_to :article, class_name: "Article", foreign_key: "articleid"
end
