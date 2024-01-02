class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many_attached :images

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "content", "created_at", "id", "subtopic", "title", "updated_at", "user_id"]
  end

end
