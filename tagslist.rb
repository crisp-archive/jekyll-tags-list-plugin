#
# Copyright (c) David Zhang, 2016
# MIT License
#

module Jekyll

  class TagsList < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super

      @text = text

      # set default values
      @threshold = 1

      # Default: asc
      # Value: asc, desc
      @order_by = 'asc'
      
      # Default: name
      # Value: name, time, count
      @sort_by = 0
      
      # @tag_link = ''
      
      @show_count = 1

      parse_params
    end # end of initialize

    def render(context)
      tags = context.registers[:site].tags.map do |tag, posts|
        [tag, posts.count] if posts.count >= @threshold
      end

      tags.compact!

      if @sort_by.eql? 'time'
        if @order_by.eql? 'desc'
          tags.reverse
        end
      else
        tags.sort! do |tag1, tag2|
          sort_seq = 0
          if @sort_by.eql? 'name'
            sort_seq = 0
          elsif @sort_by.eql? 'count'
            sort_seq = 1
          end

          if @order_by.eql? 'asc'
            tag1[sort_seq] <=> tag2[sort_seq]
          else
            tag2[sort_seq] <=> tag1[sort_seq]
          end
        end
      end

      html = ""

      tags.each do |tag, count|
        count_html = @show_count == 0 ? "" : "<div class=\"tag_item_count\">#{count}</div>"
        html << "<div class=\"tag_item\"><div class=\"tag_item_name\">#{tag}</div>#{count_html}</div>\n"
      end

      html
    end # end of render

    private

    def parse_params
      params = @text.split(',')
      params.each do |param|
        key_vals = param.split('=>', 2)
        param_name = key_vals[0].strip
        param_value = key_vals[1].strip

        if param_name.eql? ':threshold'
          param_value = param_value.to_i
          @threshold  = param_value if param_value > 0
        elsif param_name.eql? ':show_count'
          param_value = param_value.to_i
          @show_count = 0 if param_value == 0
        elsif param_name.eql? ':order_by'
          @order_by   = 'desc' if param_value.eql? 'desc'
        elsif param_name.eql? ':sort_by'
          if param_value.eql? 'time'
            @sort_by  = 'time'
          elsif param_value.eql? 'count'
            @sort_by  = 'count'
          else
            @sort_by  = 'name'
          end
        else
          next
        end
      end
    end # end of parse_params

  end # end of class

end # end of module

Liquid::Template.register_tag('tags_list', Jekyll::TagsList)
