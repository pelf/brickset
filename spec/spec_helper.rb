$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "bundler/setup"
require 'brickset'
require "pry"
require "vcr"
require "webmock/rspec"
require_relative "support/vcr"
