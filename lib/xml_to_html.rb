module XmlToHtml
  def hash_to_html(hash)
    @taxonomy_html += "<ul class='nav nav-list tree'>"

    hash.each do |key, value|
      loop_taxonomies(hash)
      break
    end

    return @taxonomy_html
  end

  def array_to_html(array)
    return @taxonomy_html += "</li></ul>" if array.nil?
    @taxonomy_html += "<ul class='nav nav-list tree'>"

    array.each do |section|
      if section["node"].is_a?(Hash)
        @taxonomy_html += "<li><label id='#{section["atlas_node_id"]}'" \
          " class='tree-toggler nav-header selectable'>#{section["node_name"]}</label>"
        hash_to_html(section["node"])
      elsif section["node"].is_a?(Array)
        @taxonomy_html += "<li><label id='#{section["atlas_node_id"]}'" \
          " class='tree-toggler nav-header selectable'>#{section["node_name"]}</label>"
        array_to_html(section["node"])
      elsif section["node"].nil?
        @taxonomy_html += "<li><a id='#{section["atlas_node_id"]}'" \
          " class='selectable' href='#'>#{section["node_name"]}</a></li>"
      end
    end
    @taxonomy_html += "</li></ul>"
  end

  def loop_taxonomies(object)
    if object["node"].is_a?(Hash)
      @taxonomy_html += "<li><label id='#{object["atlas_node_id"]}'" \
        " class='tree-toggler nav-header selectable'>#{object["node_name"]}</label>"
      hash_to_html(object["node"])
    elsif object["node"].is_a?(Array)
      @taxonomy_html += "<li><label id='#{object["atlas_node_id"]}'" \
        " class='tree-toggler nav-header selectable'>#{object["node_name"]}</label>"
      array_to_html(object["node"])
    elsif object["node"].nil?
      @taxonomy_html += "<li><a id='#{object["atlas_node_id"]}'" \
        " class='selectable' href='#'>#{object["node_name"]}</a></li></ul>"
    end
  end
end
