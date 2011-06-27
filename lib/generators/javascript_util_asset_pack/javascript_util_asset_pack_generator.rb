class JavascriptUtilAssetPackGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  
  def manifest
    copy_spinner_gif
    update_layout_add_spinner
  end
  
  private 
  
  def copy_spinner_gif
    copy_file 'spinner.gif', 'app/assets/images/spinner.gif'
  end
  
  def update_layout_add_spinner
    inject_into_file "app/views/layouts/application.html.erb", :before => "</body>\n" do
      "<%= image_tag 'spinner.gif', :alt => 'Spinner Icon' %>\n"
    end
  end
end
