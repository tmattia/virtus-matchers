# encoding: utf-8

module Virtus
  module Matchers
    class BeAValueObjectMatcher
      def matches?(klass)
        @klass = klass
        @klass.included_modules.include?(Virtus::ValueObject::InstanceMethods)
      end

      def description
        'be a value object'
      end

      def failure_message
        "expected #{@klass} to #{description}"
      end
    end

    def be_value_object
      BeAValueObjectMatcher.new
    end
    alias_method :be_a_value_object, :be_value_object
  end
end
