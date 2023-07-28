class Post < ApplicationRecord
    has_one_attached :image
    has_many :comments, dependent: :destroy
    validates :title, :content, presence: :true
end
