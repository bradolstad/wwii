class Wiki
    require 'wikipedia'
    #pass in the topic
    def initialize(topic,prepend="")
      @wiki ||= Wikipedia.find(prepend + topic)
    end

    def full_text
      if h = @wiki.sanitized_content
        paragraphs = h.scan('<p>').count
        topics = h.scan(/==(.+)==/).count
        images = @wiki.image_urls
        if h.scan(/==\s*Notes\s*==/).count > 0
          h = h.split(/==\s*Notes\s*==/).reverse.pop
        end
        if h.scan(/==\s*References\s*==/).count > 0
          h = h.split(/==\s*References\s*==/).reverse.pop
        end
        if h.scan(/==\s*See also\s*==/).count > 0
          h = h.split(/==\s*See also\s*==/).reverse.pop
        end
        if h.scan(/==\s*Footnotes\s*==/).count > 0
          h = h.split(/==\s*Footnotes\s*==/).reverse.pop
        end
        h.gsub!(/====\s*(.+)\s*====/,'<i>\1</i>')
        h.gsub!(/===\s*(.+)\s*===/,'<b>\1</b>')
        h.sub!(/<p>\s*==(.+)\s*==/,'<a class="main-list main-list-link" id="wiki_div_link_0" data-toggle="collapse" data-target="#wiki_div_0">\1</a><div id="wiki_div_0" class="collapse"><p>')
        index = 1
        if topics > 0
          while index < topics do
            h.sub!(/<p>==\s*(.+)\s*==/,'</p></div><a class="main-list main-list-link" id="wiki_div_link_'+ index.to_s + '" data-toggle="collapse" data-target="#wiki_div_'+index.to_s+'">\1</a><div id="wiki_div_'+index.to_s+'" class="collapse"><p>')
            index += 1
          end
          h = h + "</p></div>"
        end
        while images.count > 0
          if images.count.odd?
            h.sub!("<p>","<p class=\"clearfix\"><img class=\"img-polaroid\" src=\"#{images.delete_at(0)}\" width=150 align=\"left\"\>")
          else
            h.sub!("<p>","<p class=\"clearfix\"><img class=\"img-polaroid\" src=\"#{images.delete_at(0)}\" width=150 align=\"right\"\>")
          end
        end
        h
      else
        "No Wikipedia Content Found"
      end
    end

    def summary
      @wiki.sanitized_content.slice(0..275) + '...</p>'
    end
  end

