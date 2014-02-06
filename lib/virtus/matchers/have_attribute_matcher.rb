# encoding: utf-8

module Virtus
  module Matchers
    class HaveAttributeMatcher
      def initialize(name, type = nil)
        @name = name
        @type = type
      end

      def coerced_with(custom_coercer)
        @custom_coercer = custom_coercer
        self
      end

      def matches?(klass)
        @klass = klass
        @attribute = @klass.attribute_set[@name]
        return false unless @attribute

        if @type.class == Array
          return @attribute.primitive == Array &&
            @attribute.options[:member_type].primitive == @type.first
        end

        valid_type && valid_coercer
      end

      def description
        type = @type.class == Array ? "Array#{@type}" : @type
        str = "have attribute #{@name}"
        str += " of type #{type}#{coercer_description}" unless @type.nil?
        str
      end

      def failure_message
        "expected #{@klass} to #{description}"
      end

      private
      def valid_type
        @type.nil? || @attribute.primitive == @type
      end

      def valid_coercer
        @custom_coercer.nil? || @custom_coercer == @attribute.coercer
      end

      def coercer_description
        @custom_coercer && " coerced with #{@attribute.coercer}"
      end
    end

    def have_attribute(name, type = nil)
      HaveAttributeMatcher.new(name, type)
    end
  end
end
