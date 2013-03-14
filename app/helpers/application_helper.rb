module ApplicationHelper

  def link_to_pages(text)
      #todo: filter out the current page
      ops_index = Operation.list
      ops_index.each do |index|
        text.gsub! index[:name],link_to(index[:name],operation_path(index[:id]))
      end
      logger.info text
      text
    end
end
