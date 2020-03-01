require 'nokogiri'
require 'pry'

require 'open-uri'
 
class Scraper

  def self.scrape_index_page(index_url)
    #https://learn-co-curriculum.github.io/student-scraper-test-page/index.html
    
    #use nokogiri and open-uri
    # The return value of this method should be an array of hashes in which each hash represents a single student. The keys of the individual student hashes should be :name, :location and :profile_url.
    
    
    doc = Nokogiri::HTML(open(index_url))
    result = []
    doc.css(".student-card").each do |student_card|

      student_name = student_card.css(".student-name").text
      student_location = student_card.css(".student-location").text
   #   student_url = student_card.css("a")[:href]
      
      result << {:name => student_name, :location => student_location, :profile_url => student_url}
    end
    return result
    
  end

  def self.scrape_profile_page(profile_url)
    #This is a class method that should take in an argument of a student's profile URL. It should use Nokogiri and Open-URI to access that page. The return value of this method should be a hash in which the key/value pairs describe an individual student. Some students don't have a Twitter or some other social link. Be sure to be able to handle that. Once written, the following code should return a hash containing info from the provided profile_url
  end

end

puts Scraper.scrape_index_page("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html")
