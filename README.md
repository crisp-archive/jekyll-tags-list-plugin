# Jekyll Tags List Plugin

[![Join the chat at https://gitter.im/crispgm/jekyll-tags-list-plugin](https://badges.gitter.im/crispgm/jekyll-tags-list-plugin.svg)](https://gitter.im/crispgm/jekyll-tags-list-plugin?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
![](https://img.shields.io/badge/license-MIT-blue.svg)

A Liquid tag plugin for Jekyll, listed on [https://jekyllrb.com/docs/plugins/](A Liquid tag plugin for Jekyll).

## Installation

1. Add the following to your site's ```Gemfile```:

```
gem "jekyll-tagslist"
```

2. Add the following to your site's ```_config.yml```:

```
gems:
  - jekyll-tagslist
```

3. Add the following in your site's template(s):

```
<div class="article-tag">
  {% tags_list :threshold => 1, :show_count => 1, :sort_by => count, :order_by => desc %}
</div>
```

## Usage

### ```:threshold```
* Threshold of tag count
* Default Value: 1
* Values: Any positive integers

### ```:show_count```
* Whether show tag count in tags list
* Default Value: 1(which means true)
* Set to ```:show_count => 0``` if not need

### ```:sort_by```
* Default Value: name
* Values: ```name|count|time```

### ```:order_by```
* Default Value: asc
* Values: ```asc|desc```

# Example

[https://crisp.lol/archive.html](https://crisp.lol/archive.html)

Notice: The blog posts might be in Chinese.
