# encoding: utf-8

module Virtus
  module Matchers
    class HaveAttributeMatcher
      def initialize(name, type)
        @name = name
        @type = type
      end

      def matches?(klass)
        attribute = klass.attribute_set.find { |attr| attr.name == @name }
        attribute and attribute.options[:primitive] == @type
      end
    end

    def have_attribute(name, type)
      HaveAttributeMatcher.new(name, type)
    end
  end
end
