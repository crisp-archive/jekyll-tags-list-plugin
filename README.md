# Jekyll Tags List Plugin

[![Join the chat at https://gitter.im/crispgm/jekyll-tags-list-plugin](https://badges.gitter.im/crispgm/jekyll-tags-list-plugin.svg)](https://gitter.im/crispgm/jekyll-tags-list-plugin?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
![](https://img.shields.io/badge/license-MIT-blue.svg)
![](https://badge.fury.io/rb/jekyll-tagslist.svg)
[![Code Climate](https://codeclimate.com/github/crispgm/jekyll-tags-list-plugin/badges/gpa.svg)](https://codeclimate.com/github/crispgm/jekyll-tags-list-plugin)

A Liquid tag plugin for Jekyll, listed on [https://jekyllrb.com/docs/plugins/](https://jekyllrb.com/docs/plugins/).

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
      {% tags_list :threshold => 1, :show_count => 1, :sort_by => count, :order_by => desc, :limit => 20 %}
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

### ```:limit```
* Default Value: 0
* Values: Any positive integers

# Example

[https://crisp.lol/archive.html](https://crisp.lol/archive.html)

Notice: The blog posts might be in Chinese.
