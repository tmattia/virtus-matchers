# encoding: utf-8

describe Virtus::Matchers::HaveAttributeMatcher do
  class Example
    include Virtus

    attribute :foo, String
  end

  context 'when attribute is defined', 'with correct type' do
    let(:matcher) { described_class.new(:foo, String) }

    it 'should match' do
      matcher.matches?(Example).should be_true
    end
  end

  context 'when attribute is defined', 'with wrong type' do
    let(:matcher) { described_class.new(:foo, Hash) }

    it 'should not match' do
      matcher.matches?(Example).should be_false
    end
  end

  context 'when attribute is not defined' do
    let(:matcher) { described_class.new(:bar, String) }

    it 'should not match' do
      matcher.matches?(Example).should be_false
    end
  end
end
