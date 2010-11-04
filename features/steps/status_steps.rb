require 'rspec'

FIXTURES = File.expand_path('../fixtures', File.dirname(__FILE__))

xml = <<-XML
<hudson>
  <nodeDescription>My Server</nodeDescription>
  <job>
    <name>My Project</name>
    <url>http://some.url/foo</url>
    <color>COLOR</color>
  </job>
</hudson>
XML

def write(file, content)
  file = "#{FIXTURES}/#{file}"
  `mkdir -p #{File.dirname(file)}`
  File.open(file, 'w'){|f| f.write content }
end

When /^das Projekt (.*) ist$/ do |status|
  write 'api/xml', xml.sub('COLOR', status)
end

Then /^sollte der status (.*) sein$/ do |status|
  `./bin/hudson-status file:///#{FIXTURES}`.strip.should == status
end