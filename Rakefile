require "rake"

desc "Safe auto-correct"

task :auto_correct do
  sh "rubocop --auto-correct"
end

task :regression do
  sh "rspec features/specs"
  # example: rspec features/specs -t @two_empty
end
