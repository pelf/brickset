require 'net/http'
require 'open-uri'

class Web
  USER_AGENT = "Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36"

  def self.get(url, headers={})
    open url, { "User-Agent" => USER_AGENT }.merge(headers)
  end

  def self.parse(url, headers={})
    Nokogiri::HTML Web.get(url, headers)
  end
end
