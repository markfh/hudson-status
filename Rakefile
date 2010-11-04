require 'cucumber/rake/task'

task :default => :cucumber
Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w{--format pretty}
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 'hudson-status'
    gem.summary = "Show hudson status from the command line. (example project for a lecture)"
    gem.email = "grosser.michael@gmail.com"
    gem.homepage = "http://github.com/grosser/#{gem.name}"
    gem.authors = ["Michael Grosser"]
    gem.add_dependency 'nokogiri'
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: gem install jeweler"
end
