# -*- encoding: utf-8 -*-

GRAMMAR_SOURCE = "grammar/prunille.tt"
GRAMMAR_TARGET = "lib/prunille/parser/prunille.rb"

desc 'Check for code smells'
task :reek do
  puts 'Checking for code smells...'
  files = Dir.glob 'lib/**/*.rb'
  files.delete GRAMMAR_TARGET
  args = files.join(' ')
  exec "reek --quiet #{args} | ./reek.sed"
end

file GRAMMAR_TARGET => [GRAMMAR_SOURCE] do
  puts "Compiling TreeTop grammar..."
  sh "tt #{GRAMMAR_SOURCE} --output #{GRAMMAR_TARGET} --force"
end

desc 'Test Prunille'
task :test => GRAMMAR_TARGET do 
  puts 'Testing Prunille...'
  sh "rspec --color --format documentation spec"
end

