require 'nokogiri'

class HudsonStatus
  def self.status(url)
    url = "#{url}/api/xml"
    xml = download_xml(url)
    begin
      projects = parse_projects_from_xml(xml)
    rescue
      raise "Invalid XML from #{url}"
    end

    projects.map do |project|
      name = project.css('name').first.content
      color = project.css('color').first.content
      status = status_from_hudson_color(color)
      [name, status]
    end
  end

  private

  def self.parse_projects_from_xml(xml)
    raise if xml.strip.empty?
    document = Nokogiri.parse(xml)
    jobs = document.css('hudson > job')
    raise if jobs.empty?
    jobs
  end

  def self.download_xml(url)
    `curl '#{url}' --silent`.strip
  end

  def self.status_from_hudson_color(color)
    color_codes = {
      'red' => 'Failed',
      'blue' => 'Success',
      'blue_anime' => 'Pending',
      'red_anime' => 'Pending'
    }
    (color_codes[color] || "Unknown #{color}")
  end
end