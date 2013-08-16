module DirectoryHelper
  def map(people)
    gmaps4rails(style_map_markers(people))
  end

  def style_map_markers(people)
    people.to_gmaps4rails do |person, marker|

      marker.infowindow "
        <a href=\"/#{person.link_path}/#{person.id}\">
          <img src=\"#{person.user.gravatar}\" height=\"60\" width=\"60\" align=\"left\" style=\"margin-right:15px\">
          <h4>
            #{person.name}
          </h4>
        </a>"
      marker.picture({
        :picture => image_path("#{person.marker_category}.png"),
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
