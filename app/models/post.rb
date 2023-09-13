class Post < ApplicationRecord
validates :body, :imagem, presence: true

  belongs_to :user
  has_one_attached :imagem do |att|
    att.variant :timeline, resize_to_limit: [200, 200]
  end
end
