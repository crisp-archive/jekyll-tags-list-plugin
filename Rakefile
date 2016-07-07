task default: %w[build]

# require "lib/markdown-table-formatter"

task :build do
  sh "gem build *.gemspec"
  sh "sudo gem install *.gem"
end