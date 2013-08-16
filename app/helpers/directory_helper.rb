module DirectoryHelper
  def map(people)
    gmaps4rails(style_map_markers(people))
  end

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
      marker.picture({
        :picture => image_path("#{person.class}.png"),
        :width   => 30,
        :height  => 30,
        :marker_anchor => [5, 10],
        :shadow_picture => image_path("shadow.png"),
        :shadow_width => 110,
        :shadow_height => 110,
        :shadow_anchor => [5, 10],
      })
    end
  end

end
