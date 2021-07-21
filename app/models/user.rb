class User < ApplicationRecord
  def test_level(level)
    @tests = []
    @id = self.id
    usertests = UserTest.all.where(user_id: @id)
    usertests.map do |usertest|
      test_id = usertest.test_id
      Test.all.where(id: test_id).where(level: level).pluck(:title)
    end
    #@tests.each do |test|
     # test.each do |p|
      #  puts p.title
      #end
    #end
  end
end
