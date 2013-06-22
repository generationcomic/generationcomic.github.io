require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

ASSETS_DIR = 'assets'
SASS_DIR   = File.join ASSETS_DIR, 'sass'
CSS_DIR    = File.join ASSETS_DIR, 'css'

def sass(maps={}, opts={})
  opts = {
    :style => "expanded",
    :watch => false,
    :require => "./lib/generation/sass.rb",
  }.merge(opts)

  cmd =  ["sass"]
  cmd << "--style #{opts[:style]}" if opts[:style]
  cmd << "--watch" if opts[:watch]
  cmd << "-r #{opts[:require]}" if opts[:require]
  cmd << maps.map do |src, target|
           "#{File.join(SASS_DIR, src)}:#{File.join(CSS_DIR, target)}"
         end

  cmd.flatten.join(" ")
end

task :watch do
  sh sass({"site.scss" => "site.css"}, {:watch => true})
end

task :compile do
  sh sass({"site.scss" => "site.css"}, {:style => "compressed"})
end
