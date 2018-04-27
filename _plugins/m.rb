module Jekyll
		class RandomTag < Liquid::Tag
			def initialize(tag_name, markup, tokens)
				@max = markup.to_i
				super
			end

			def render(context)
				rand(@max)
			end
		end
end

Liquid::Template.register_tag('random', Jekyll::RandomTag)