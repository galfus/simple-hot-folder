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
    def self.for_files(input_path, error_path, output_path = nil)
      HotFolder.new(input_path, error_path, output_path)
    end

    def initialize(input_path, error_path, output_path)
      @input_path = input_path
      @error_path = error_path
      @output_path = output_path
      @validate_file = default_validate_file_function
    end

    def process_input!
      entries = read_input(@input_path)
      entries.each do |entry|
        begin
          yield entry
          FileUtils.mv(entry.path, @output_path) if File.exist?(entry.path)
        rescue Exception => e
          move_file_to_error!(entry, e)
        end
      end
    end

    private

    def move_file_to_error!(entry, exception)
      FileUtils.mv(entry.path, @error_path) if File.exist?(entry.path)
      write_error_file(entry, exception.message)
    end

    def write_error_file(entry, text)
      path = "#{@error_path}/#{entry.name}.txt"
      File.open(path, 'w') { |file| file.write(text) }
    end

    def read_input(path)
      Dir.entries(path)
        .map { |name| Entry.new(name, "#{path}/#{name}") }
        .keep_if { |entry| processable?(entry) }
        # .each { |entry| p entry.path }
        # .keep_if { |entry| @validate_file.(entry) }
    end

    def validate_entry(entry)
      entry
    end

    def processable?(entry)
      return false if !File.file?(entry.path)
      return false if IGNORE_FOLDERS.include?(entry.name)
      return false if entry.name.start_with?('.')
      true
    end

    def default_validate_file_function
      ->(file) { 
        true
      }
    end
   
  end

  class HotFolder::Entry
    attr_reader :name
    attr_reader :path
    def initialize(name, path)
      @name = name
      @path = path
    end
  end

end

