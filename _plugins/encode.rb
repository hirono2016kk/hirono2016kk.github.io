# Tweet Liquid Tag
#
# Example:
#   {% tweet 464180168303456256 %}
#

require 'net/http'
require 'json'

module Jekyll
  class EncodeWord < Liquid::Tag

    #
    #
    #
    def render(context)

      if tag_contents = determine_arguments(@markup.strip)
        id_name = tag_contents #
        tweet_script_tag(id_name)
      else
        raise ArgumentError.new <<-eos
           Syntax error
          eos
      end

    end

   private

   #
   #
   #
   def determine_arguments(input)

    return input

   end

   #
   #
   #
   def tweet_script_tag(id_name)

#       result = Net::HTTP.get(URI.parse("https://api.twitter.com/1/statuses/oembed.json?id=#{id_name}"))
#       json   = JSON.parser.new(result)
#       hash   =  json.parse()
#       parsed = hash['html']
#
#       return parsed
     return URI.escape(id_name)

   end

  end
end

Liquid::Template.register_tag('url_escape', Jekyll::EncodeWord)
