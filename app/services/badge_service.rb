class BadgeService

  def initialize(user, test)
    @test = test
    @user = user
  end

  def add
    Badge.all.each do |badge|
      @user.badges << badge if send("#{badge.rule}_award?", badge.value)
    end
  end

  def category_award?(value)
    @tests = Test.all.list_category(value).pluck(:id)
    @user.badges.pluck(:value).exclude?(value) && ((@user.user_tests.list_complited.pluck(:test_id) & @tests) == @tests)
  end

  def first_award?(x)
    @user.user_tests.list_complited.ids.drop(1).each do |value|
      if value == @user.user_tests.list_complited.pluck(:test_id).first
        true
      end
    end
  end

  def level_award?(level)
    @test_level = Test.all.list_level(level).pluck(:id)
    @user.badges.pluck(:value).exclude?(level) && ((@user.user_tests.list_complited.pluck(:test_id) & @test_level) == @test_level)
  end

end
