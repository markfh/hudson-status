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

def hudson_status
  `./bin/hudson-status file:///#{FIXTURES} 2>&1`.strip
end

When /^der Server offline ist$/ do
  write 'api/xml', ''
end

When /^der Server falsch antwortet$/ do
  write 'api/xml', '<moo></moo>'
end

When /^das Projekt (.*) ist$/ do |status|
  write 'api/xml', xml.sub('COLOR', status)
end

Then /^sollte die Ausagabe (.*) sein$/ do |status|
  hudson_status.should == status
end

Then /^sollte die Ausagabe (.*) enthalten$/ do |status|
  hudson_status.should include(status)
end