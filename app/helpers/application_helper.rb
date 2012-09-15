module ApplicationHelper
  
  
  def i(icon, white_version=false)
    icon = "icon-#{icon}"
    icon += " icon-white" if white_version
    content_tag(:i, "", class: icon)
  end
  
end
