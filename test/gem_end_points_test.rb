require 'test_helper'

class TestGemEndPoints < Minitest::Test

  def test_create_hot_folder_for_files
    hf = SimpleHotFolder.for_files(
      SimpleHotFolder::Test::FOLDERS[:input],
      SimpleHotFolder::Test::FOLDERS[:error],
      SimpleHotFolder::Test::FOLDERS[:output]
    )
    refute_nil hf
  end

end
