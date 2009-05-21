class NiftyLayoutGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
    @name = @args.first || 'application'
  end
  
  def manifest
    record do |m|
      m.directory 'app/views/layouts'
      m.directory 'public/stylesheets'
      m.directory 'app/helpers'
      
      if options[:haml]
        m.directory 'public/stylesheets/sass'
        m.template "layout.html.haml", "app/views/layouts/#{file_name}.html.haml"
        m.file     "stylesheet.sass",  "public/stylesheets/sass/#{file_name}.sass"
      else
        m.template "layout.html.erb", "app/views/layouts/#{file_name}.html.erb"
        # stylesheets
        m.file     "stylesheet.css",  "public/stylesheets/#{file_name}.css"
        m.file     "print.css", "public/stylesheets/print.css"
        m.file     "screen.css", "public/stylesheets/screen.css"
        m.file     "styles.css", "public/stylesheets/styles.css"
        m.file     "ie6.css", "public/stylesheets/ie6.css"
        # images
        m.file     "iu_crimson.gif", "public/images/iu_crimson.gif"
        m.file     "iupui-footer.gif", "public/images/iupui-footer.gif"
        m.file     "iu_white.gif", "public/images/iu_white.gif"
        m.file     "blockiu_white.gif", "public/images/blockiu_white.gif"
      end
      m.file "helper.rb", "app/helpers/layout_helper.rb"
    end
  end
  
  def file_name
    @name.underscore
  end

  protected

    def add_options!(opt)
      opt.separator ''
      opt.separator 'Options:'
      opt.on("--haml", "Generate HAML for view, and SASS for stylesheet.") { |v| options[:haml] = v }
    end

    def banner
      <<-EOS
Creates generic layout, stylesheet, and helper files.

USAGE: #{$0} #{spec.name} [layout_name]
EOS
    end
end
