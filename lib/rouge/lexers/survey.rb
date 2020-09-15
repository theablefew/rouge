# -*- coding: utf-8 -*- #
# frozen_string_literal: true

module Rouge
  module Lexers
    class Survey < RegexLexer
      tag 'survey'
      filenames '*.b', '*.bf'
      mimetypes 'text/x-brainfuck'

      title "Survey"
      desc "Marketcast Survey Language"

      start { push :bol }

      cattr_accessor :keywords

      state :bol do
        rule %r/[ \r\t]+/, Text
        rule(//) { pop! }
      end

      state :root do

        mixin :base_tag
        mixin :comment
      end

      state :comment do
        rule %r/##.*$/, Comment::Single
      end

      state :base_tag do
        rule %r/(\[BASE\:.*\])/, Keyword
      end



    end
  end
end
