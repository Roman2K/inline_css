# InlineCSS

Ruby library for inlining CSS rules defined in `<style>` tags into each
individual HTML element. Made for preparing HTML e-mails, may apply to other
uses.

Note: normalizes HTML through `Nokogiri::HTML`; as a result, a DOCTYPE and
parent `<html>` element may be added if missing.

## Usage

```ruby
html = <<-HTML
  <style>
    span {
      color: red;
    }
  </style>
  
  <span>Some text</span>
HTML

prepared_html = InlineCSS.inline_css(html)
```
