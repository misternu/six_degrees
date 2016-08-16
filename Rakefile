require_relative 'lib/six_degrees'

task default: :run

desc 'Get the first user\'s connections'
task :run do
  SixDegrees.run(ARGV.last)
end
