class ApplicationController < ActionController::Base
  protect_from_forgery

  class Wiki
    require 'wikipedia'
    #pass in the topic
    def initialize(topic)
      @topic = 'Operation ' + topic
      @wiki ||= self.search
    end

    def search
      if wiki = Wikipedia.find(@topic)
        wiki
      else
        nil
      end
    end

    def full_text
      images = @wiki.image_urls.shuffle
      h = @wiki.sanitized_content
      images.each do |image|
        num = rand(1..6)
        if num==1
          h.sub!("<p>","<p class=\"clearfix\"><img class=\"img-polaroid\" src=\"#{image}\" width=150 align=\"left\")\">")
        elsif num==2
          h.sub!("<p>","<p class=\"clearfix\"><img class=\"img-polaroid\" src=\"#{image}\" width=150 align=\"right\")\">")
        else
          h.sub!("<p>","<p class=\"clearfix\">")
        end
      end
      h
    end

    def summary
      @wiki.sanitized_content.slice(0..275) + '...</p>'
    end
  end

end
