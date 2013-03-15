module ApplicationHelper

  def link_to_pages(text,id = 0)
      #todo: filter out the current page
      ops_index = Operation.list
      ops_index.each do |index|
        unless index[:id] == id || text.nil?
        text.gsub! index[:name],link_to(index[:name],operation_path(index[:id]))
        end
      end
      text
  end
end
