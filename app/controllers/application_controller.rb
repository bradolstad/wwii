class ApplicationController < ActionController::Base
  protect_from_forgery

  class Wiki
    require 'wikipedia'

    def initialize(topic)
      @topic = 'Operation ' + topic
      @wiki = self.search
    end

    def search
      if wiki = Wikipedia.find(@topic)
        wiki.sanitized_content
      else
        nil
      end
    end

    def full_text
      @wiki
    end

    def summary
      @wiki.slice(0..275) + '...</p>'
    end
  end

end
