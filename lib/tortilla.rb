require 'httparty'
require 'json'

module Tortilla
  class RequestBuilder
    attr_accessor :url
    attr_accessor :headers
    attr_accessor :response_parser

    def initialize
      @url = ""
      @headers = {}
      @response_parser = nil
    end

    def method_missing(meth,*args,&block)
      @url = @url+"/"+meth.to_s

      if(!args.first.nil? && !args.nil?)
        @url+"/"+args.first
      end

      return self
    end

    def get(*args)
      puts @url
      response = HTTParty.get(@url)
      if(!@response_parser.nil?)
        parsed = @response_parser.call(response)
      else
        parsed = JSON.parse(response.body)
      end

      return parsed
    end

    def set_header(name,value)
      @headers[name] = value
    end
  end

  class ApiWrapper
    def initialize(domain)
      @domain = domain
      @request = RequestBuilder.new
    end

    def

    def headers
      return @request.headers
    end

    def method_missing(meth,*args,&block)
      @request.url= @domain+"/"+meth.to_s

      if(!args.first.nil? && !args.nil?)
        @request.url = @request.url+"/"+args.first
      end

      return @request
    end

    def on_response(&block)
      @request.response_parser = block
    end
  end

  def self.wrap(domain)
    return Tortilla::ApiWrapper.new(domain)
  end
end
