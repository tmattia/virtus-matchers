# encoding: utf-8

module Virtus
  module Matchers
    class HaveAttributeMatcher
      def initialize(name, type)
        @name = name
        @type = type
      end

      def matches?(klass)
        @klass = klass
        attribute = @klass.attribute_set[@name]
        return false unless attribute
        if @type.class == Array
          attribute.primitive == Array &&
            attribute.options[:member_type].primitive == @type.first
        else
          attribute.primitive == @type
        end
      end

      def description
        type = @type.class == Array ? "Array#{@type}" : @type
        "have attribute #{@name} of type #{type}"
      end

      def failure_message
        "expected #{@klass} to #{description}"
      end
    end

    def have_attribute(name, type)
      HaveAttributeMatcher.new(name, type)
    end
  end
end
