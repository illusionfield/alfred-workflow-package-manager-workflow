require 'open-uri'
require 'yaml'

module Workflow
  class Remote

    def self.index(query = nil)
      url = "#{HOST}/workflows.json"
      url = "#{url}?query=#{query}" if query
      workflows = YAML::load open(url).read
      return workflows
    end

    def self.get(id)
      url = "#{HOST}/workflows/#{id}.json"
      workflow = YAML::load open(url).read
      return workflow
    end

    def self.search(query)
      self.index(query)
    end
  end
end
