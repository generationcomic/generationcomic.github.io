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
gem 'compass'
gem 'zurb-foundation'
gem 'rake'

# Dev compilation (rake watch)
os :linux do
  gem 'rb-inotify'
end
os :mac do
  gem 'rb-fsevent', '~> 0.9'
end

# Dev webserver
gem 'rack'
gem 'rack-rewrite'

