# Jekyll Tags List Plugin

## Usage

```
<div class="article_tag">
  {% tags_list :threshold => 1, :show_count => 1, :sort_by => count, :order_by => desc %}
</div>
```

## Parameters

* ```:threshold```
* Threshold of tag count
* Default Value: 1
* Values: Any positive integers

```:threshold => 1```

* ```:show_count```
* Whether show tag count in tags list
* Default Value: 1(which means true)
* Set to ```:show_count => 0``` if not need

```:show_count => 1```

* ```:sort_by```
* Default Value: name
* Values: name|count|time

```:sort_by => count```

* ```:order_by```
* Default Value: asc
* Values: asc|desc

```:order_by => desc```
