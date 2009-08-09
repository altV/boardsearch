require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FileManager do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    FileManager.create!(@valid_attributes)
  end

  it "should load parameters as array"

  it "should load its parameters from db"
end
