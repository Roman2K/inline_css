# InlineCSS

Ruby library for inline CSS rules defined in `<style>` tags into each individual HTML element. Made for preparing HTML e-mails, may apply to other uses.

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
