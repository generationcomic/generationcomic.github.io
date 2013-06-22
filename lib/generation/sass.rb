require 'base64'

module Generation
  module Sass

    def base64_encode_asset(path, content_type)
      assert_type path, :String
      assert_type content_type, :String

      mime = case content_type.value
             when "png" then "image/png"
             when "svg" then "image/svg+xml"
             end
      data = Base64.strict_encode64(File.read(path.value))
      ::Sass::Script::String.new("'data:#{mime};base64,#{data}'")
    end

    def url_base64_encode_asset(*args)
      ::Sass::Script::String.new(
        "url(#{base64_encode_asset(*args).value})"
      )
    end

  end
end
module Sass::Script::Functions
  include Generation::Sass
end
