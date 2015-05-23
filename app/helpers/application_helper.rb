module ApplicationHelper

def full_title(page_title)
  base_title = "CApp"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
 end

    
 def nav_link( link_path, link_text)
  class_name = current_page?(link_path) ? 'active' : ''
  content_tag(:li, :class => class_name) do
    link_to link_path do
        link_text.html_safe
        end
  end
end

def whose?(user, object)
case object
  when Post
    owner = object.author
  when Comment
    owner = object.user
  else
    owner = nil
end
if user and owner
  if user.id == owner.id
    "his"
  else
    "#{owner.nickname}'s"
  end
else
  ""
end
end

def link_to_trackable(object, object_type)
if object
  link_to object_type.downcase, object
else
  "a #{object_type.downcase} which does not exist anymore"
end
end
    
def javascript(*files)
  content_for(:head) { javascript_include_tag(*files) }
end

def stylesheet(*files)
  content_for(:head) { stylesheet_link_tag(*files) }
end
    

    
end
