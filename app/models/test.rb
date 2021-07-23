class Test < ApplicationRecord
  def self.list_category(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where('categories.title like ? ', category)
  end
end
