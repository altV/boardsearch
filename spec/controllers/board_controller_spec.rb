require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BoardController do

  #Delete these examples and add some real ones
  it "should use BoardController" do
    controller.should be_an_instance_of(BoardController)
  end


  describe "GET 'search'" do
    it "should be successful" do
      get 'search'
      response.should be_success
    end
  end

  describe "GET 'admin'" do
    it "should be successful" do
      get 'admin'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end
end
