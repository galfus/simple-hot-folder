require 'test_helper'

module SimpleHotFolder
  class TestListenHotFolder < Minitest::Test

    def setup
      Test::initialize_test_folders!
      @files = [
        Test::FILE1,
        Test::FILE2,
      ]
      @hf = HotFolder.new(
        Test::FOLDERS[:input],
        Test::FOLDERS[:error]
      )
    end

    def test_listen_and_stop_after_the_first_item_is_processed
      i = 0
      @hf.listen_input! do |item|
        puts "Iteration #{i}"
        i += 1
        @hf.stop_listening_after_this_item 
      end
      content = Test.content_of_folders
      assert_equal 1, i
      assert !content[:input].include?(Test::FILE1)
      assert content[:input].include?(Test::FILE2)
      assert !content[:error].include?(Test::FILE1)
      assert !content[:error].include?(Test::FILE2)
    end

  end
end
