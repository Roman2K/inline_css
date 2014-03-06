require 'minitest/autorun'
require 'nokogiri'

class InlineCSSTest < MiniTest::Unit::TestCase
  def test_identity
    html = "<span></span>"
    assert_inlines html, html

    html = <<-HTML
<style>
</style>
<span>Test</span>
</span>
    HTML
    assert_inlines html, html
  end

  def test_add_style
    html = <<-HTML
<style>
  div { color: blue }
  span { color: red }
</style>
<span>Test</span>
</span>
    HTML
    expected = <<-HTML
<style>
  div { color: blue }
  span { color: red }
</style>
<span style="color: red">Test</span>
</span>
    HTML
    assert_inlines expected, html
  end

  def test_append_style
    html = <<-HTML
<style>
  div { color: blue }
  span { color: red }
</style>
<span style="font-weight: bold">Test</span>
</span>
    HTML
    expected = <<-HTML
<style>
  div { color: blue }
  span { color: red }
</style>
<span style="font-weight: bold; color: red">Test</span>
</span>
    HTML
    assert_inlines expected, html
  end

private

  def assert_inlines(expected_result, html)
    result = InlineCSS.inline_css(html)
    assert_dom_equal expected_result, result
  end

  def assert_dom_equal(expected, actual)
    assert_equal normalize_dom(expected), normalize_dom(actual)
  end

  def normalize_dom(html)
    Nokogiri::HTML(html).to_html
  end
end
