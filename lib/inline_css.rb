require 'nokogiri'
require 'crass'

module InlineCSS
  class << self
    def inline_css(html)
      doc = Nokogiri::HTML(html)
      doc.css('style').each do |style_el|
        parse_css_rules(style_el.text).each do |selector, style|
          doc.css(selector).each do |html_el|
            html_el['style'] = [html_el['style'], style].compact.join('; ')
          end
        end
      end
      doc.to_html
    end

  private

    def parse_css_rules(css)
      Crass.parse(css).
        lazy.
        map { |rule| rule.values_at(:selector, :children) }.
        select { |s, c| s && c }.
        map { |s, c| [s[:value], Crass::Parser.stringify(c).strip] }
    end
  end
end
