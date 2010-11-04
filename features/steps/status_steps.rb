require 'rspec'

fixtures = File.expand_path('../fixtures', File.dirname(__FILE__))

When /^das Projekt ist (.*)$/ do |status|
  @url = "file:///#{fixtures}/#{status}.xml"
end

Then /^sollte der status (.*) sein$/ do |status|
  `./bin/hudson-status #{@url}`.strip.should == status
end