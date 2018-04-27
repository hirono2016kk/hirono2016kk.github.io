# Tweet Liquid Tag
#
# Example:
#   {% tweet 464180168303456256 %}
#

require 'net/http'
require 'json'

module Jekyll
  class TweetTag < Liquid::Tag

    #
    #
    #
    def render(context)

      if tag_contents = determine_arguments(@markup.strip)
        tweet_id = tag_contents #
        chk =  tweet_script_tag(tweet_id)
        if chk.nil? then
          "<span style='color: red;'>error データの取得に失敗しました。このツイートは存在しない可能性があります。</span>"
        else
          chk
        end

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
   def tweet_script_tag(tweet_id)

      result = Net::HTTP.get(URI.parse("https://api.twitter.com/1/statuses/oembed.json?id=#{tweet_id}"))
      json   = JSON.parser.new(result)
      hash   =  json.parse()
      parsed = hash['html']

      return parsed

   end

  end
end

Liquid::Template.register_tag('tweet', Jekyll::TweetTag)
