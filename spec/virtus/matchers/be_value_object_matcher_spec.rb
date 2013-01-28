# encoding: utf-8

describe Virtus::Matchers::BeAValueObjectMatcher do
  class Example
  end

  class ExampleValueObject
    include Virtus::ValueObject
  end

  let(:matcher) { described_class.new }

  context 'when Virtus::ValueObject is included' do
    it 'should match' do
      matcher.matches?(ExampleValueObject).should be_true
    end

    it 'should have a description' do
      matcher.matches?(ExampleValueObject)
      matcher.description.should == 'be a value object'
    end
  end

  context 'when Virtus::ValueObject is not included' do
    it 'should not match' do
      matcher.matches?(Example).should be_false
    end

    it 'should have a failure message' do
      matcher.matches?(Example)
      matcher.failure_message.should == "expected #{Example} to be a value object"
    end
  end
end
