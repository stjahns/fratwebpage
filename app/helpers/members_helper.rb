module MembersHelper
  def add_links
    html ="<li>"
    html << select_tag("links[][mytype]", options_for_select(Link::MYTYPES)) 
    html << text_field_tag("links[][url]")
    html << "</li>"
    return html
  end
  
end
