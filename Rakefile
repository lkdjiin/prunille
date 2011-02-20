# -*- encoding: utf-8 -*-

desc 'Check for code smells'
task :reek do
  puts 'Checking for code smells...'
  files = Dir.glob 'lib/**/*.rb'
  files.delete 'lib/prunille/prunille.rb'
  args = files.join(' ')
  sh "reek --quiet #{args} | ./reek.sed"
end

GRAMMAR_SOURCE = "./grammar/prunille.tt"
GRAMMAR_TARGET = "./lib/prunille/prunille.rb"

file GRAMMAR_TARGET => [GRAMMAR_SOURCE] do
  puts "Compiling TreeTop grammar..."
  sh "tt #{GRAMMAR_SOURCE} --output #{GRAMMAR_TARGET} --force"
end

desc 'Test Prunille'
task :test => "./lib/prunille/prunille.rb" do 
  puts 'Testing Prunille...'
  sh "rspec --color --format documentation spec"
end


