# Simple Hot Folder

### NOTE

This gem is at an early stage of development. Please do not use it already.


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
  puts "Now, the file is automatically moved to the output folder"
end

# On error
hot_folder.process_input! do |entry|
  puts "Processing file #{entry.name}..."
  puts "File path: #{entry.path}"
  puts "The file will be automatically moved to the error folder"
  puts "A text file will be created with the error message ('Trigger error')"
  puts "The process will continue with the next file"
  raise 'Trigger error'
end
```

## License

The MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
