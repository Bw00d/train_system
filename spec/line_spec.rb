require 'spec_helper'

describe Line do
  describe '#initialize' do
    it 'should create an instance of Line' do
      test_line = Line.new ({ :name => "Red" })
      test_line.should be_an_instance_of Line
    end

    it 'initializes a line with a name and an id' do
      test_line = Line.new({ :name => "Red" })
      test_line.name.should eq "Red"
    end
  end

  describe '.create' do
    it 'initializes a line and saves it to the database' do
      test_line = Line.create({ :name => "Red", :source_id => 1, :destination_id => 5 })
      Line.all.should eq  [test_line]
    end
  end

  describe '.all' do
    it 'should be empty to start' do
      Line.all.should eq []
    end
  end

  describe '#save' do
    it 'saves an instance to the database' do
      test_line = Line.new({ :name => "Red", :source_id => 1, :destination_id => 2 })
      test_line.save
      Line.all.should eq [test_line]
    end
  end

  describe '#==' do
    it 'compares two stations based on their name and id' do
      test_line1 = Line.new({ :name => "Red", :id => 1, :source_id => 1, :destination_id => 2 })
      test_line2 = Line.new({ :name => "Red", :id => 1, :source_id => 1, :destination_id => 2 })
      test_line1.should eq test_line2
    end
  end

  # describe 'all_stops' do
  #   it 'returns and array of all stations on the line' do
  #     test_line = Line
  #   end
  # end
end







