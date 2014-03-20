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

  describe '.create' do
    it 'initializes with a name and an id' do
      test_station = Station.create({ :name => "Beaverton" })
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

  describe '#delete' do
    it 'removes a station from the database' do
      test_station = Station.create({ :name => "Sunset", :id => 2})
      test_station2 = Station.create({ :name => "Beaverton", :id => 1})
      test_station.delete
      Station.all.should eq [test_station2]
    end
  end

  describe 'modify' do
    it 'allows a user update the name of the station' do
      test_station = Station.create({ :name => "beaverton" })
      test_station.modify({ :name => "Beaverton"})
      test_station.name.should eq "Beaverton"
    end
  end

  describe '#==' do
    it 'compares two stations based on their name and id' do
      test_station1 = Station.new({ :name => "Beaverton", :id => 1 })
      test_station2 = Station.new({ :name => "Beaverton", :id => 1 })
      test_station1.should eq test_station2
    end
  end

  describe 'find_name_by_id' do
    it 'returns the name of a station when given the id' do
      test_station1 = Station.create({ :name => "Beaverton" })
      test_station2 = Station.create({ :name => "Hillsboro" })
      test_station3 = Station.create({ :name => "Airport" })
      Station.find_name_by_id(test_station3.id).should eq "Airport"
    end
  end

  describe 'find_id_by_name' do
    it 'returns the id of a station when given the name' do
      test_station1 = Station.create({ :name => "Beaverton" })
      test_station2 = Station.create({ :name => "Hillsboro" })
      test_station3 = Station.create({ :name => "Airport" })
      Station.find_id_by_name(test_station3.name).should eq test_station3.id
    end
  end
end



