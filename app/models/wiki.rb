class Wiki
    require 'wikipedia'
    #pass in the topic
    def initialize(topic)
      @wiki ||= Wikipedia.find('Operation ' + topic)
    end

    def full_text
      if images = @wiki.image_urls
        images.shuffle!
        h = @wiki.sanitized_content
        images.each do |image|
          num = (1..6).to_a.sample
          if num==1
            h.sub!("<p>","<p class=\"clearfix\"><img class=\"img-polaroid\" src=\"#{image}\" width=150 align=\"left\")\">")
          elsif num==2
            h.sub!("<p>","<p class=\"clearfix\"><img class=\"img-polaroid\" src=\"#{image}\" width=150 align=\"right\")\">")
          else
            h.sub!("<p>","<p class=\"clearfix\">")
          end
        end
        h
      else
        nil
      end
    end

    def summary
      @wiki.sanitized_content.slice(0..275) + '...</p>'
    end
  end

