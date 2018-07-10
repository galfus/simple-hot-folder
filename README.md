# Simple Hot Folder

### NOTE

This gem is at an early stage of development. Please do not use it already.}


## Install

```bash
gem install simple_hot_folder
```

## Usage

```ruby
require 'simple_hot_folder'

hot_folder = SimpleHotFolder.for_files(
  '/path/to/input_folder',
  '/path/to/error_folder',
  '/path/to/output_folder'
)

# Successful
hot_folder.process_input! do |entry|
  puts "Processing file #{entry.name}..."
  puts "File path: #{entry.path}"
  puts "The file is automatically moved to the output folder"
end

# On error
hot_folder.process_input! do |entry|
  puts "Processing file #{entry.name}..."
  puts "File path: #{entry.path}"
  puts "The file is automatically moved to the error folder"
  puts "A text file is created with the error message"
  puts "The process will continue with the next file"
  raise 'Trigger error'
end
```
