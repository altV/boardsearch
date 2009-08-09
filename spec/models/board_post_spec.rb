require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BoardPost do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    BoardPost.create!(@valid_attributes)
  end

  it "should acquire posts from the internet (using Mechanize)" do
    id = 5146587
    res = BoardPost.acquire_post(id)

    res.id.should == id
    res.title.should == "кстати, наш военком выписывает предупреждение, если ты сам пришел, а не милиция доставила :)"
    res.body.should == "кстати, в принципе, если стоишь на учете, то с чего тебе без повестки шляться? только если сменил место жительства там или работы. а для первичной постановки при этом, как ни странно, являться тоже надо по повестке. вот такая интересная коллизия: с одной стороны, ты обязан стоять на учете, а с другой -- вставать на учет надо по повестке <IMG BORDER=0 SRC=\"pic/smile.gif\" ALT=\":)\">"
  end

  it "should acquire posts from the internet with no body (-)" do
    id = 5146593
    res = BoardPost.acquire_post(id)

    res.id.should == id
    res.title.should == "+"
    res.body.should be_nil
  end

  it "should acquire post #5146594" do
    id = 5146594
    res = BoardPost.acquire_post(id)

    res.id.should == id
    res.title.should == "Я в Питер за 5 часов не доеду."
    res.body.should be_nil
  end

  it "should acquire deleted post as entries with null body field" do
    [5146693, 5146700, 5146703].each do |id|
      res = BoardPost.acquire_post(id)
      res.id.should == id
      res.body.should be_nil
    end

  end

  it "should have post method using scrubyt"

  it "should parse post # 5246165, okay?" do
    post = BoardPost.acquire_post(5246165)

    post.id.should == 5246165
    post.title.should == "8ka, народ , вы в курсе когда нам включат холодую воду?"
  end
end
