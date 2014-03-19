require 'spec_helper'

describe Station do
  describe '#initialize' do
    it 'should create and instance of Station' do
      test_station = Station.new({ :name => "Beaverton" })
      test_station.should be_an_instance_of Station
    end

    it 'initializes with a name and an id' do
      test_station = Station.new({ :name => "Beaverton" })
      test_station.name.should eq "Beaverton"
    end
  end

  describe '.all' do
    it 'should be empty to start' do
      Station.all.should eq []
    end
  end

  describe '#save' do
    it 'saves a new station to the database' do
      test_station = Station.new({:name => "Beaverton"})
      test_station.save
      Station.all.should eq [test_station]
    end
  end

  describe '#==' do
    it 'compares two stations based on their name and id' do
      test_station1 = Station.new({ :name => "Beaverton", :id => 1 })
      test_station2 = Station.new({ :name => "Beaverton", :id => 1 })
      test_station1.should eq test_station2
    end
  end
end


