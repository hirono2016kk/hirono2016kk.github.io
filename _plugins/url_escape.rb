# URL エスケープする
module URLEscapeFilter
  def url_escape(input)
    ERB::Util.u input
  end
end

Liquid::Template.register_filter(URLEscapeFilter)
