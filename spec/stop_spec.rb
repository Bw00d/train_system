require 'spec_helper'

describe Stop do
  describe '#initialize' do
    it 'creates an instance of Stop' do
      test_stop = Stop.new({ :line_id => 1,:station_id =>3 })
      test_stop.should be_an_instance_of Stop
    end

    it 'initializes an instance of Stop with a line_id, a station_id, and an id' do
      test_stop = Stop.new({ :line_id => 1, :station_id =>3, :id =>1 })
      p test_stop
      test_stop.line_id.should eq 1
    end

    it 'initializes an instance of Stop with a line_id, a station_id, and an id' do
      test_stop = Stop.new({ :line_id => 1,:station_id =>3, :id =>1 })
      test_stop.station_id.should eq 3
    end

    it 'initializes an instance of Stop with a line_id, a station_id, and an id' do
      test_stop = Stop.new({ :line_id => 1,:station_id =>3, :id =>1 })
      test_stop.id.should_not be_nil
    end
  end

  describe '.all' do
    it 'should start out empty' do
      Stop.all.should eq []
    end
  end

  describe '#save' do
    it 'saves a new stop to the database' do
      test_stop = Stop.new({ :line_id => 1, :station_id => 3})
      test_stop.save
      Stop.all.should eq  [test_stop]
    end
  end

  describe '#==' do
    it 'compares two stops based on the attributes' do
      test_stop1 = Stop.new({ :line_id => 1, :station_id => 3})
      test_stop2 = Stop.new({ :line_id => 1, :station_id => 3})
      test_stop1.should eq test_stop2
    end
  end

 end














