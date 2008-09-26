task :default do
  system "gem build loggable.gemspec"
  system "sudo gem uninstall loggable"
  system "sudo gem install loggable"
end