def require_all(path)
  glob = File.join(__dir__, path, "*.rb")
  Dir[glob].sort.each do |f|
    require f
  end
end

# stdlib
require "fileutils"
require "ostruct"
# simple_hot_folder lib
require_all "simple_hot_folder"

module SimpleHotFolder

  # Create hot folder that listens for files.
  #
  # @param [String] input_path Input folder path
  # @param [String] error_path Error folder path
  # @return [HotFolder]
  def self.for_files(input_path, error_path)
    HotFolder.new(input_path, error_path)
  end

end
