
#<<<<<<< HEAD
require 'nokogiri'
# =======
# <<<<<<< HEAD
# >>>>>>> 082643665c7e1744ca2f36d3919f95e5f5dded81
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url)).css(".student-card")
    doc.map do |info| 
      name = info.css("h4.student-name").text
      location = info.css("p.student-location").text
      link = info.css("a @href").text
      {:name => name, :location => location, :profile_url => link}
    end
  end

  def self.scrape_profile_page(profile_url)
    collection = {}
    doc = Nokogiri::HTML(open(profile_url))
    links = doc.css("div.social-icon-container a").collect{|l| l["href"]}
    links.each do |link|     
      if link.include?("twitter")
        collection[:twitter] = link
      elsif link.include?("linkedin")
        collection[:linkedin] = link 
      elsif link.include?("github")
        collection[:github] = link 
      elsif link.include?(".com")
        collection[:blog] = link 
        end
      end
      collection[:bio] =  doc.css("div.bio-content.content-holder").css("div.description-holder").text.strip
      collection[:profile_quote] = doc.css(".profile-quote").text.strip
      collection
      binding.pry
    end

end

# <<<<<<< HEAD
# =======
# :name => doc.css("div.card-text-container").first.css("h4.student-name").text
# :location => project.css("div.card-text-container").first.css(".student-location").text
# :profile_url => 
#=======
require 'nokogiri'
require 'open-uri'
require 'pry'

# class Scraper

#   def self.scrape_index_page(index_url)
#     doc = Nokogiri::HTML(open(index_url)).css(".student-card")
#     doc.map do |info| 
#       name = info.css("h4.student-name")
#     binding.pry
#     end
#   end

 

# end



#arr.css("div.roster-cards-container").css(".student-card").css("h4.student-name").first.text

#student_card = doc.css(".student-card").first.css("a").first["href"]
# >>>>>>> 66af886441414b3a99b2ed78f083c05c2744f65a
# >>>>>>> 082643665c7e1744ca2f36d3919f95e5f5dded81
