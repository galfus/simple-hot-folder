require "minitest/autorun"
require "minitest/reporters"
require_relative "../lib/simple_hot_folder"

# Report with color.
Minitest::Reporters.use! [
  Minitest::Reporters::SpecReporter.new
]

# Initialize default test settings
module SimpleHotFolder
  module Test

    BASE_PATH ||= File.expand_path('../..', __FILE__).freeze
    HF_PATH ||= "#{BASE_PATH}/test-data/hot-folder"

    def self.test_folders
      full_path = ->(folder) { "#{HF_PATH}/#{folder}" }
      {
        input: full_path.('input'),
        error: full_path.('error'),
        output: full_path.('output'),
        initial: full_path.('initial-data'),
      }
    end

    def self.initialize_test_folders!
      exit if !FOLDERS[:input].start_with?(HF_PATH)
      exit if !FOLDERS[:error].start_with?(HF_PATH)
      exit if !FOLDERS[:output].start_with?(HF_PATH)
      system(%Q(rm -f "#{FOLDERS[:input]}/"*))
      system(%Q(rm -f "#{FOLDERS[:error]}/"*))
      system(%Q(rm -f "#{FOLDERS[:output]}/"*))
      system(%Q(cp -r "#{FOLDERS[:initial]}/"* "#{FOLDERS[:input]}"))
    end

    def self.content_of_folders
      {
        input: content_folder(FOLDERS[:input]),
        error: content_folder(FOLDERS[:error]),
        output: content_folder(FOLDERS[:output]),
      }
    end

    def self.content_folder(path)
      Dir.entries(path).join("\n")
    end

    FOLDERS ||= test_folders
    FILE1 = 'file1.jpg'
    FILE2 = 'file2.jpg'

  end
end
