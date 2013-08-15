module DirectoryHelper
  def map(people)
    gmaps4rails(style_map_markers(people))
  end

  def style_map_markers(people)
    people.to_gmaps4rails do |person, marker|
      marker.infowindow render(:partial => "/directory/map-infowindow", :locals => { :person => person })
      marker.picture({
        :picture => image_path("#{person.class}.png"),
        :width   => 30,
        :height  => 30,
        :marker_anchor => [5, 10],
        :shadow_width => 110,
        :shadow_height => 110,
        :shadow_anchor => [5, 10],
      })
    end
  end

end
