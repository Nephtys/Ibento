module ApplicationHelper
  def readable_timestamp(timestamp)
    return timestamp.strftime("%a, %d %b %Y, %Hh%M")
  end

  def link_to_edit(object, options = {}, html_options = {})
    options =  options.merge!({:class => 'edit', :title => 'Edit'})
    link_to( 'Edit', object, options, html_options )
  end
  def link_to_delete(object, options = {}, html_options = {})
    options =  options.merge!({:method => :delete, :confirm => 'Are you sure?', :class => 'delete', :title => 'Delete'})
    link_to( 'Delete', object, options, html_options )
  end
  def link_to_done(object, options = {}, html_options = {})
    options =  options.merge!({:class => 'done', :title => "Go back, I'm done"})
    link_to( "I'm done", object, options, html_options )
  end
  def link_to_new(title, object, options = {}, html_options = {})
    options =  options.merge!({:class => 'new', :title => title})
    link_to( title, object, options, html_options )
  end
end
