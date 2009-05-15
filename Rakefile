require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('nifty-generators', '0.2.4iupui') do |p|
  p.project        = "niftygenerators"
  p.description    = "A collection of useful generator scripts for Rails."
  p.url            = "http://github.com/ryanb/nifty-generators"
  p.author         = 'Ryan Bates and David Blankenship'
  p.email          = "dblanken (at) iupui (dot) edu"
  p.ignore_pattern = ["script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
