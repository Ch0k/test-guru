class Semversion
  attr_reader :semversion
  def initialize(major,minor,patch)
    @major = major
    @minor = minor
    @patch = patch
    @semversion = [@major, @minor, @patch]
  end
end

@version = Semversion.new(1,0,0)