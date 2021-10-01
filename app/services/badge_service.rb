class BadgeService

  def initialize(user, test)
    @test = test
    @user = user
  end

  def call
    Badge.all.each do |badge|
      @user.badges << badge if send("#{badge.rule}_award?", badge)
    end
  end

  def have_not_badge?(badge)
    @user.badges.exclude?(badge)
  end

  def category_award?(badge)
    @tests = Test.list_category_order_id(badge.value)
    have_not_badge?(badge) && ((@user.user_tests.list_complited.pluck(:test_id) & @tests) == @tests)
  end

  def first_award?(x)
    @user.user_tests.where(test_id: @test.id).count == 1
  end

  def level_award?(badge)
    @test_level = Test.all.list_level(badge.value).pluck(:id)
    have_not_badge?(badge) && ((@user.user_tests.list_complited.pluck(:test_id) & @test_level) == @test_level)
  end

end
