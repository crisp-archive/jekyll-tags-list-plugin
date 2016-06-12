# Jekyll Tags List Plugin

[![Join the chat at https://gitter.im/crispgm/jekyll-tags-list-plugin](https://badges.gitter.im/crispgm/jekyll-tags-list-plugin.svg)](https://gitter.im/crispgm/jekyll-tags-list-plugin?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
![](https://img.shields.io/badge/license-MIT-blue.svg])

## Usage

```
<div class="article_tag">
  {% tags_list :threshold => 1, :show_count => 1, :sort_by => count, :order_by => desc %}
</div>
```

## Parameters

### ```:threshold```
* Threshold of tag count
* Default Value: 1
* Values: Any positive integers

```:threshold => 1```

### ```:show_count```
* Whether show tag count in tags list
* Default Value: 1(which means true)
* Set to ```:show_count => 0``` if not need

```:show_count => 1```

### ```:sort_by```
* Default Value: name
* Values: name|count|time

```:sort_by => count```

### ```:order_by```
* Default Value: asc
* Values: asc|desc

```:order_by => desc```

# Example

[https://crisp.lol/archive.html](https://crisp.lol/archive.html)

Notice: The blog posts might be in Chinese.
