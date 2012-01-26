require 'libthai'
require 'iconv'
require 'thbrk/core_ext'

module Thbrk
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def thbrk
      send :include, InstanceMethods

      class_eval do
        before_save :word_break
      end
    end

    def define_thai_columns(*args)
      @@thai_columns = []
      args.each do |arg|
        @@thai_columns << arg
      end
    end

    def thai_columns
      @@thai_columns
    end
  end

  module InstanceMethods
    def word_break
      thai_break_text = []
      self.class.thai_columns.each do |thai_column|
        thai_break_text << self.send(thai_column) unless self.send(thai_column).nil?
      end
      self.thbrk = thai_break_text.join(" ").gsub(","," ").to_thbrk
    end
  end
end

ActiveRecord::Base.send(:include, Thbrk)