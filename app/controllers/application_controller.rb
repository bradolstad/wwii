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
      #todo: add images
      #todo: add links to other operations
      @wiki.sanitized_content
    end

    def summary
      @wiki.sanitized_content.slice(0..275) + '...</p>'
    end
  end

end
