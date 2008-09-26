task :default do
  system "gem build loggable.gemspec"
  system "sudo gem uninstall loggable"
  system "sudo gem install loggable"
end

task :test do
  load "test/test_loggable.rb"
end