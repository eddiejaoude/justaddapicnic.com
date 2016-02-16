#!/usr/bin/env ruby
# -*- ruby -*-

require 'rake/clean'
require 'rake/testtask'

task :default => :test

task :test do
  ruby './tests/tests.rb'
end

task :build do
	ruby './build/build.rb'
end