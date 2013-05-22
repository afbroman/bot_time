require_relative 'spec_helper'

describe 'BotTime' do

  it "creates a BotTime object" do
    bt = BotTime.new("1/1/1960")
    bt.class.should eq BotTime
  end

  it "creates a single-date object when given a single date" do
    bt = BotTime.new "2/14/2013"
    bt.length.should == 1
    bt.dates[0].should eq Date.new(2013,2,14)
  end

  it "creates an array of dates when given a start date and an end date" do
    bt = BotTime.new "2/14/2013", "2/19/2013"
    bt.length.should == 6
    bt.dates.first.should eq Date.new(2013,2,14)
    bt.dates[4].should eq Date.new(2013,2,18)
    bt.dates.last.should eq Date.new(2013,2,19)
  end

  it "creates an array of dates over a year change" do
    bt = BotTime.new "12/28/2013", "1/5/2014"
    bt.length.should == 9
    bt.dates.first.should eq Date.new(2013,12,28)
    bt.dates.last.should eq Date.new(2014,1,5)
  end

  it "returns its length as number of dates included" do
    bt = BotTime.new "12/28/2013", "1/5/2014"
    bt.length.should == 9
  end

  it "can return an array of Brazilian date strings" do
    bt = BotTime.new "12/28/2013", "1/5/2014"
    br_dates = bt.strings_br
    br_dates.first.should eq "28/12/2013"
    br_dates.last.should eq "05/01/2014"
  end


  it "can return an array of Brazilian url-safe date strings" do
    bt = BotTime.new "2/14/2013", "2/19/2013"
    safe = bt.url_safe_br
    safe.first.should eq "14%2F02%2F2013"
    safe.last.should eq "19%2F02%2F2013"
  end
end