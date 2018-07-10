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
  # Your code goes here...
end
