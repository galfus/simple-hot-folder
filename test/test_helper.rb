require "minitest/autorun"
require "minitest/reporters"
require_relative "../lib/simple_hot_folder"

# Report with color.
Minitest::Reporters.use! [
  Minitest::Reporters::SpecReporter.new
]
