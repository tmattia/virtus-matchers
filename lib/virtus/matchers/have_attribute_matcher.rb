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
          attribute.options[:primitive] == Array && attribute.options[:member_type] == @type.first
        else
          attribute.options[:primitive] == @type
        end
      end

      def failure_message
        "expected #{@klass} to have attribute #{@name} of type #{@type}"
      end
    end

    def have_attribute(name, type)
      HaveAttributeMatcher.new(name, type)
    end
  end
end
