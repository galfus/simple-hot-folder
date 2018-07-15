require 'test_helper'

# module SimpleHotFolder
#   class TestListenHotFolder < Minitest::Test

#     def setup
#       Test::initialize_test_folders!
#       @files = [
#         Test::FILE1,
#         Test::FILE2,
#       ]
#       @hf = HotFolder.new(
#         Test::FOLDERS[:input],
#         Test::FOLDERS[:error],
#         Test::FOLDERS[:output],
#       )
#     end

#     def test_listen_hot_folder
#       files = []
#       @hf.process_input! do |item|
#         files << item.name
#       end
#       content = Test.content_of_folders
#       assert_equal @files, files.sort
#       assert !content[:input].include?(Test::FILE1)
#       assert !content[:input].include?(Test::FILE2)
#       assert !content[:error].include?(Test::FILE1)
#       assert !content[:error].include?(Test::FILE2)
#       assert !content[:output].include?(Test::FILE1)
#       assert !content[:output].include?(Test::FILE2)
#     end

#     def test_move_to_output_processed_files
#       @hf.process_input! do |item|
#         FileUtils.mv(item.path, Test::FOLDERS[:output])
#       end
#       content = Test.content_of_folders
#       assert !content[:input].include?(Test::FILE1)
#       assert !content[:input].include?(Test::FILE2)
#       assert content[:output].include?(Test::FILE1)
#       assert content[:output].include?(Test::FILE2)
#     end

#     def test_process_file_with_errors
#       @hf.process_input! do |item|
#         raise 'Trigger error for file1' if item.name == Test::FILE1
#       end
#       content = Test.content_of_folders
#       assert !content[:input].include?(Test::FILE1)
#       assert !content[:input].include?(Test::FILE2)
#       assert content[:error].include?(Test::FILE1)
#       assert content[:error].include?(Test::FILE1 + '.txt')
#     end

#   end
# end
