module DirectoryHelper


  def style_map_markers(people)
    people.to_gmaps4rails do |person, marker|
        marker.infowindow "
        <a href=\"/students/#{person.id}\">
          <img src=\"#{person.pic}\" height=\"60\" width=\"60\" align=\"left\" style=\"margin-right:15px\">
          <h4>
            #{person.name}
          </h4>
        </a>
        <p style=\"margin-top:-5px\"> #{person.developer_type}
        </p>"
      end
  end
  
end
