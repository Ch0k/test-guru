class BadgeService

  def initialize(user, test)
    @test = test
    @user = user
  end

  def add
    add_badge(Badge.backend_badge) if complite_all_backends_tests?
    add_badge(Badge.first_badge) if first_success_test?
    add_badge(Badge.level_badge) if complited_tests_all_level?
  end

  def add_badge(badge)
    @user.badges.push(badge)
  end

  def complite_all_backends_tests?
    if @user.badges.backend_badge.empty?
      @backend_test = Test.all.list_category('backend').pluck(:id)
      (@user.complited_tests.ids & @backend_test) == @backend_test
    end 
  end

  def first_success_test?
    @user.complited_tests.ids.drop(1).each do |value|
      if value == @user.complited_tests.ids.first
        true
      end
    end
  end

  def complited_tests_all_level?
    @test_level = Test.all.list_level(@test.level).pluck(:id)
    (@user.complited_tests.ids & @test_level) == @test_level
  end

end
