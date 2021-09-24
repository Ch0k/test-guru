class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  def self.backend_badge
    Badge.all.where(rule: 1)
  end

  def self.first_badge
    Badge.all.where(rule: 2)
  end

  def self.level_badge
    Badge.all.where(rule: 3)
  end
end
