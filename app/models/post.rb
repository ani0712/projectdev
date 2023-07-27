class Post < ApplicationRecord
    include Visible
    has_many :comments, dependent: :destroy
    has_one_attached :image  
    validates :title, :content, presence: :true

    VALID_STATUSES = ['public', 'private', 'archived']

    validates :status, inclusion: { in: VALID_STATUSES }

    def archived?
      status == 'archived'
    end
end
