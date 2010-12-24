module MalcolmX
  require 'rubygems'
  require 'httparty'
  require 'crack/json'

  def self.find(domain_name)
    response = HTTParty.get("http://instantdomainsearch.com/services/quick/?name=vabhub")
    json_response = Crack::JSON.parse(response.body)
  end
end
