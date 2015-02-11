require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'giant_bomb_api'
require 'rspec'
require 'timecop'
require 'pry-byebug'

RSpec.configure do |config|

  config.after(:each) do
    Timecop.return
  end

end