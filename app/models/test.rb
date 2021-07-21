class Test < ApplicationRecord
  def self.list_category(category)
    category_id = Category.where(title: category).first.id
    Test.all.where(category_id: category_id).order(created_at: :desc).pluck(:title)
  end
end
