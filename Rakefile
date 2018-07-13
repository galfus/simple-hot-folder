require "rake/testtask"
require_relative "lib/simple_hot_folder/version"

def name
  SimpleHotFolder::NAME
end

def version
  SimpleHotFolder::VERSION
end

def gemspec_file
  "#{name}.gemspec"
end

def gem_file
  "#{name}-#{version}.gem"
end

def show_text(text)
  puts ''
  puts '================================================='
  puts text
  puts '================================================='
  puts ''
end

def show_error_and_exit!(text)
  show_text("ERROR: #{text}.")
  exit!
end

def show_release
  show_text("#{gem_file} released.")
end

def read_changelog
  `head -20 CHANGELOG.md`.to_s
end

def current_branch
  r = `git branch`.to_s.strip
  if r.include? "master"
    'master'
  else
    'other'
  end
end

def git_status
  r = `git status`.to_s
  if r.include? "nothing to commit"
    'clean'
  else
    'not_clean'
  end
end

def ask_for_confirmation
  puts "Are you sure you want to release version #{version}? [yN]"
  STDIN.gets.chomp.upcase
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.warning = false
  t.verbose = false
end

task :default => :test

desc "Release #{gem_file} (only repository, not RubyGems)"
task :release => :build do
  show_text ">> Releasing #{gem_file}"
  if current_branch != 'master'
    msg = "You must be on the master branch to release!"
    show_error_and_exit! msg
  end
  if git_status != 'clean'
    msg = "There are still files left to commit"
    show_error_and_exit! msg
  end
  show_text ">> Changelog file"
  puts read_changelog
  show_text ">> Confirmation"
  if ask_for_confirmation != 'Y'
    show_error_and_exit! "Aborting release"
  end
  puts ""
  sh "git commit --allow-empty -m 'Release #{version}'"
  sh "git tag v#{version}"
  puts ""
  sh "git push origin master"
  puts ""
  sh "git push github master"
  show_release
end

desc "Push code to the remote respositories"
task :push do
  show_text ">> Pushing code to GitLab y GitHub"
  puts ""
  sh "git push origin master"
  puts ""
  sh "git push github master"
  puts ""
end

desc "Build #{gem_file} into pkg folder"
task :build do
  show_text ">> Creating #{gem_file}"
  mkdir_p "pkg"
  sh "gem build #{gemspec_file}"
  sh "mv #{gem_file} pkg"
  puts ""
end

desc "Publish #{gem_file} in RubyGems"
task :publish do
  show_text ">> Publishing  #{gem_file}"
  puts ""
  sh "gem push pkg/#{gem_file}"
  puts ""
end

desc "Show current #{name} version"
task :version do
  show_text("Version #{version}")
end





