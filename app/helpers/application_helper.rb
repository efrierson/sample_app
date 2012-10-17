module ApplicationHelper
  
  def title
    base_title = "Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    image_tag("logo.png", :alt => "The Craziest Awesomest App Ever", :class => "round")
  end

end
