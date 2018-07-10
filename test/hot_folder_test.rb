require 'test_helper'

module SimpleHotFolder
  class TestHotFolder < Minitest::Test

    def setup
      Test::initialize_test_folders!
      @files = [
        Test::FILE1,
        Test::FILE2,
      ]
      @hf = HotFolder.new(
        Test::FOLDERS[:input],
        Test::FOLDERS[:error],
        Test::FOLDERS[:output],
      )
    end

    def test_process_files_successfully
      files = []
      @hf.process_input! do |entry|
        files << entry.name
        FileUtils.mv(entry.path, Test::FOLDERS[:output])
      end
      content = Test.content_of_folders
      assert_equal @files, files
      assert !content[:input].include?(Test::FILE1)
      assert !content[:input].include?(Test::FILE2)
      assert content[:output].include?(Test::FILE1)
      assert content[:output].include?(Test::FILE2)
    end

    def test_process_files_and_move_to_output_automatically
      @hf.process_input! do |entry|
      end
      content = Test.content_of_folders
      assert !content[:input].include?(Test::FILE1)
      assert !content[:input].include?(Test::FILE2)
      assert content[:output].include?(Test::FILE1)
      assert content[:output].include?(Test::FILE2)
    end

    def test_process_file_with_errors
      @hf.process_input! do |entry|
        raise 'Trigger error for file1' if entry.name == Test::FILE1
      end
      content = Test.content_of_folders
      assert !content[:input].include?(Test::FILE1)
      assert !content[:input].include?(Test::FILE2)
      assert content[:error].include?(Test::FILE1)
      assert content[:error].include?(Test::FILE1 + '.txt')
      assert !content[:output].include?(Test::FILE1)
      assert content[:output].include?(Test::FILE2)
    end

    # def test_validate_files
    #   validateFile = ->(file) { 
    #     true
    #   }
    #   hf.validateInputWith(validateFile)
    # end

  end
end
