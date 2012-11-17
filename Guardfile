# encoding: utf-8

guard 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/virtus/matchers/(.+)\.rb$}) { |m| "spec/virtus/matchers/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb') { "spec" }
end

