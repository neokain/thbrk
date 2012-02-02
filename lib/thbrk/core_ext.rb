#!/usr/bin/env ruby
# encoding: utf-8

require "iconv"
require 'libthai'

String.class_eval do
  def to_thbrk

    utf8_to_tis620 = Iconv.new("TIS620//IGNORE", "UTF-8")
    a = LibThai::brk_line(utf8_to_tis620.iconv(self).join(""))

    tis620_to_utf8 = Iconv.new("UTF-8//IGNORE", "TIS620")
    o = tis620_to_utf8.iconv(a).join("")

    return o
  end
end
