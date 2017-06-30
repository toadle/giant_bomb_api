require 'giant_bomb_api'
require 'rspec'
require 'timecop'
require 'pry-byebug'
require 'simplecov'
SimpleCov.start

RSpec.configure do |config|

  config.after(:each) do
    Timecop.return
  end

end
