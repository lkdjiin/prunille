# -*- encoding: utf-8 -*-

GRAMMAR_SOURCE = "grammar/prunille.tt"
GRAMMAR_TARGET = "lib/prunille/parser/prunille.rb"

desc 'Tests'
task :default => :test

desc 'Check for code smells'
task :reek do
  puts 'Checking for code smells...'
  files = Dir.glob 'lib/**/*.rb'
  files.delete GRAMMAR_TARGET
  args = files.join(' ')
  exec "reek --quiet #{args} | ./reek.sed"
end

desc 'Check for duplicate code'
task :flay do
  puts 'Check for duplicate code'
  files = Dir.glob 'lib/**/*.rb'
  files.delete GRAMMAR_TARGET
  args = files.join(' ')
  exec "flay #{args}"
end

file GRAMMAR_TARGET => [GRAMMAR_SOURCE] do
  puts "Compiling TreeTop grammar..."
  sh "tt #{GRAMMAR_SOURCE} --output #{GRAMMAR_TARGET} --force"
end

desc 'Test Prunille'
task :test => GRAMMAR_TARGET do 
  puts 'Testing Prunille...'
  exec "rspec --color --format documentation spec"
end

desc 'Generate yard documentation'
task :doc do 
	exec 'yardoc --title "Prunille Developper\'s Documentation" - COPYING'
end
