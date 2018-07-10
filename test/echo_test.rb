require 'test_helper'

class TestEcho < Minitest::Test

  def test_hello
    echo = SimpleHotFolder::Echo.new
    assert_equal 'Hello!', echo.say('Hello!')
  end

end
