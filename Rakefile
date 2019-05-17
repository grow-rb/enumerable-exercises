# frozen_string_literal: true

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['**/*_test.rb']
end

task default: :test
