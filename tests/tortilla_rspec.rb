require_relative '../lib/tortilla.rb'

describe Tortilla::ApiWrapper do
  before :each do
    @api = Tortilla::ApiWrapper.new("http://testapi.bramvdb.com")
  end

  describe "#new" do
    it "is an instance of Tortilla::ApiWrapper" do
      expect(@api).to be_an_instance_of Tortilla::ApiWrapper
    end

    it "must be provided with one parameter" do
      expect(lambda {Tortilla::ApiWrapper.new}).to raise_exception ArgumentError
    end
  end

  describe "#user" do
    it "is an instance of Tortilla::RequestBuilder" do
      expect(@api.user).to be_an_instance_of Tortilla::RequestBuilder
    end

    it "has url http://testapi.bramvdb.com/user" do
      expect(@api.user.url).to eq "http://testapi.bramvdb.com/user"
    end

    describe "#get" do
      it "responds with {\"status\": \"ok\",\"path\": \"/user\",\"headers\": false,\"method\": \"get\"}" do

      end
    end
  end

  describe "#user(1)" do
    it "has url http://testapi.bramvdb.com/user/1" do
      expect(@api.user(1).url).to eq "http://testapi.bramvdb.com/user/1"
    end
  end
end
