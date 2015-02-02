require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'giant_bomb_api'
require 'rspec'
require 'timecop'

RSpec.configure do |config|

  config.after(:each) do
    Timecop.return
  end

end