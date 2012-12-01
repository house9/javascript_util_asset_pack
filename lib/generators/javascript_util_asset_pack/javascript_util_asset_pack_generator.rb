class JavascriptUtilAssetPackGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def manifest
    copy_spinner_gif
    update_layout_add_spinner
    update_layout_add_rails_env_to_js
    update_application_js
    run_safe_logger_generator
  end

  private

  def run_safe_logger_generator
    generate "javascript_safe_logger"
  end

  def update_application_js
    inject_into_file "app/assets/javascripts/application.js", "//= require util_pack\n", :before => "//= require_tree .\n"
  end

  def copy_spinner_gif
    copy_file 'spinner.gif', 'app/assets/images/spinner.gif'
  end

  def update_layout_add_spinner
    inject_into_file "app/views/layouts/application.html.erb", :before => "</body>\n" do
      "    <%= image_tag 'spinner.gif', :alt => 'Spinner Icon', :id => 'spinner', :style => 'display:none' %>\n"
    end
  end

  def update_layout_add_rails_env_to_js
    inject_into_file "app/views/layouts/application.html.erb", :before => "</head>\n" do
<<-CONTENT
    <script>
      window.Rails = window.Rails || {};
      window.Rails.env = "<%= Rails.env.upcase %>";
    </script>
CONTENT
    end
  end
end
