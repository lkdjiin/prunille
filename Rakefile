# -*- encoding: utf-8 -*-

def ruby_files_for_shell
  files = Dir.glob 'lib/**/*.rb'
  files.join(' ')
end

desc 'Tests'
task :default => :test

desc 'Check for code smells'
task :reek do
  puts 'Checking for code smells...'
  args = ruby_files_for_shell
  exec "reek --quiet #{args} | ./reek.sed"
end

desc 'Check for duplicate code'
task :flay do
  puts 'Check for duplicate code...'
  args = ruby_files_for_shell
  exec "flay #{args}"
end

desc 'Test Prunille'
task :test do 
  puts 'Testing Prunille...'
  exec "rspec --color --format documentation spec"
end

desc 'Generate yard documentation'
task :doc do 
  args = ruby_files_for_shell
	exec "yardoc --title \"Prunille Developper's Documentation \" #{args} - COPYING"
end
