require 'digest/sha1'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :validatable,
          :confirmable
  has_many :gist
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :author_tests, class_name: "Test", foreign_key: "author_id"
  has_and_belongs_to_many :badges
  validates :email, presence: true, uniqueness: true,  format: { with: URI::MailTo::EMAIL_REGEXP } 

  def add_badge(level)
    add_backend_badges
    add_first_test_badges
    add_level_badges(level)
  end

  def add_backend_badges
    if self.complite_all_backends_tests?
      badge = Badge.backend_badge
      self.badges.push(badge)
    end
  end

  def add_first_test_badges
    if self.first_success_test?
      badge = Badge.first_badge
      self.badges.push(badge)
    end
  end

  def add_level_badges(level)
    if self.complited_tests_all_level(level)
      badge = Badge.level_badge
      self.badges.push(badge)
    end
  end

  def complite_all_backends_tests?
    @backend_test = Test.all.list_category('backend').pluck(:id)
    (@complited_user_test & @backend_test) == @backend_test 
  end

  def user_test_complited_and_passed
    @complited_user_test = []
    self.user_tests.each do |user_test|
      if user_test.complited? && user_test.passed?
        @complited_user_test.push(user_test.test.id)
      end
    end
  end

  def first_success_test?
    @complited_user_test.uniq!.nil?
  end

  def complited_tests_all_level(level)
    @test_level = Test.all.list_level(level).pluck(:id)
    if @test_level.empty?
      false
    else
      if (@complited_user_test & @test_level) == @test_level
        true
      end
    end
  end

  def test_level(level)
    tests.where(level: level).where('user_tests.user_id = ?', self.id).pluck(:title)
  end

  def user_test(test)
    user_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end

end
