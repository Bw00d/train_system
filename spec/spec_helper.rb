require 'rspec'
require 'pg'
require 'station'
require 'line'


DB = PG.connect({:dbname => 'train_system'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stations *;")
    DB.exec("DELETE FROM lines *;")
  end
end
