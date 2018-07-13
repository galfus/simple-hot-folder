module SimpleHotFolder
  class HotFolder

    IGNORE_FOLDERS = [
      '.',
      '..',
    ]

    # Create hot folder that listens for files.
    #
    # @param [String] input_path Input folder path
    # @param [String] error_path Error folder path
    # @param [String] output_path Error folder path
    # @return [HotFolder]
    def initialize(input_path, error_path, output_path)
      @input_path = input_path
      @error_path = error_path
      @output_path = output_path
      @validate_file = default_validate_file_function
    end

    # Yield a {Item} for each file/folder in the input path.
    # Each file/folder is automatically deleted after the yield
    # block is executed.
    #
    # @yieldparam [Item] item The file/folder.
    def process_input!
      entries = read_input(@input_path)
      entries.each do |item|
        begin
          yield item
          FileUtils.rm(item.path) if File.exist?(item.path)
        rescue Exception => e
          move_file_to_error!(item, e)
        end
      end
    end

    private

    def move_file_to_error!(item, exception)
      FileUtils.mv(item.path, @error_path) if File.exist?(item.path)
      write_error_file(item, exception.message)
    end

    def write_error_file(item, text)
      path = "#{@error_path}/#{item.name}.txt"
      File.open(path, 'w') { |file| file.write(text) }
    end

    def read_input(path)
      Dir.entries(path)
        .map { |name| Item.new(name, "#{path}/#{name}") }
        .keep_if { |item| processable?(item) }
        # .each { |item| p item.path }
        # .keep_if { |item| @validate_file.(item) }
    end

    def validate_item(item)
      item
    end

    def processable?(item)
      return false if !File.file?(item.path)
      return false if IGNORE_FOLDERS.include?(item.name)
      return false if item.name.start_with?('.')
      true
    end

    def default_validate_file_function
      ->(file) { 
        true
      }
    end
   
  end

  # Each file or folder from the input folder.
  #
  # @param [String] name Name of the file/folder.
  # @param [String] path Path of the file/folder.
  class HotFolder::Item
    attr_reader :name
    attr_reader :path
    def initialize(name, path)
      @name = name
      @path = path
    end
  end

end

