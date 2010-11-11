require 'generators/nifty'

module Nifty
  module Generators
    class LayoutGenerator < Base
      argument :layout_name, :type => :string, :default => 'application', :banner => 'layout_name'

      class_option :haml, :desc => 'Generate HAML for view, and SASS for stylesheet.', :type => :boolean

      def create_layout
        if options.haml?
          template 'layout.html.haml', "app/views/layouts/#{file_name}.html.haml"
          copy_file 'stylesheet.sass', "public/stylesheets/sass/#{file_name}.sass"
        else
          template 'layout.html.erb', "app/views/layouts/#{file_name}.html.erb"
          copy_file 'stylesheet.css', "public/stylesheets/#{file_name}.css"
          copy_file 'print.css', "public/stylesheets/print.css"
          copy_file "screen.css", "public/stylesheets/screen.css"
          copy_file "styles.css", "public/stylesheets/styles.css"
          copy_file "ie6.css", "public/stylesheet/ie6.css"
          copy_file "rails.css", "public/stylesheet/rails.css"
          
          copy_file "iu_crimson.gif", "public/images/iu_crimson.gif"
          copy_file "iupui-footer.gif", "public/images/iupui-footer.gif"
          copy_file "iu_white.gif", "public/images/iu_white.gif"
          copy_file "blockiu_white.gif", "public/images/blockiu_white.gif"
        end
        copy_file 'layout_helper.rb', 'app/helpers/layout_helper.rb'
        copy_file 'error_messages_helper.rb', 'app/helpers/error_messages_helper.rb'
      end

      private

      def file_name
        layout_name.underscore
      end
    end
  end
end
