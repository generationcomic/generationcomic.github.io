source 'https://rubygems.org'

# Platform helpers
def os(name)
  matcher = case name
            when :linux   then /linux/
            when :mac     then /darwin/
            when :windows then /mingw|mswin/
            end
  RbConfig::CONFIG['host_os'] =~ matcher && yield
end

# Compilation
gem 'sass'
gem 'bourbon'
gem 'neat'

os :linux do
  gem 'rb-inotify'
end
os :mac do
  gem 'rb-fsevent', '~> 0.9'
end

gem 'rake'

# Dev webserver
gem 'rack'
gem 'rack-rewrite'

