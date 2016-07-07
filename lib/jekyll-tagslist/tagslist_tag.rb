#
# Copyright (c) David Zhang, 2016
# MIT License
#

module Jekyll

  module Tagslist

    class TagslistTag < Liquid::Tag

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
        @sort_by = 'count'

        # Default: 0, no limit
        # Value: integers
        @limit = 0

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
        
        tag_count = 0

        tags.each do |tag, count|
          if tag_count > @limit
            break
          end
          count_html = @show_count == 0 ? "" : "<div class=\"tag-item-count\">#{count}</div>"
          html << "<div class=\"tag-item\"><div class=\"tag-item-name\">#{tag}</div>#{count_html}</div>\n"
          tag_count = tag_count + 1
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
          elsif param_name.eql? ':limit'
            param_value = param_value.to_i
            @limit = param_value if param_value > 0
          else
            next
          end
        end
      end # end of parse_params

    end # end of class

  end # end of module

end # end of module

Liquid::Template.register_tag('tags_list', Jekyll::Tagslist::TagslistTag)
