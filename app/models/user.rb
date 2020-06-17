class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, class_name: 'Article', foreign_key: 'authorid'
  has_many :votes, class_name: 'Vote', foreign_key: 'userid'

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
end
