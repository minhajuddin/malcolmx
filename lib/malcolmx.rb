module MalcolmX
  require 'rubygems'
  require 'httparty'
  require 'crack/json'

  def self.find(domain_names = [], &block)
    if domain_names.empty?
      show_instructions 
      return
    end

    domain_names.collect do |domain|
      response = lookup(domain)
      response.delete("name")
      parsed_response = response.collect do |tld, status|
        {
          :domain => "#{domain}.#{tld}",
          :available => status == "a"
        }
      end
      yield(parsed_response)
    end
  end

  private

  def self.lookup(domain)
    response = HTTParty.get("http://instantdomainsearch.com/services/quick/?name=#{domain}")
    json_response = Crack::JSON.parse(response.body)
  end
end
