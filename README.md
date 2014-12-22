Tortilla.rb
==============
![TravisBuildStatus](https://api.travis-ci.org/bramvdbogaerde/tortilla.rb.png?branch=master)

This is a port of [Tortilla](https://github.com/redodo/tortilla) originally written for use in Python. But I thought it would also be useful in Ruby.

It works basically the same as the original Python project, but I will give you a simple example.

## Example

```
github = Tortilla.wrap("https://api.github.com")
github.users("octocat").get()["location"]
# => "San Francisco"
```
Right now authentication headers are not supported. But I'm working on that.

By default Tortilla will parse a JSON response into a Ruby hash. But you can  implement your own parsing methods by adding them to Tortilla per API.

Example:

```
api = Tortilla.wrap("https://xmlapi.example.com")
api.on_response do |response|
  SomeCoolXMLParser.parse(response.body)
end
api.users("bramvdbogaerde").get
```

The response object is from the gem HTTParty, so for detailed documentation about the response, you should take a look at their gem.

## Roadmap
* Support adding customs headers (like authentication headers) [__IN PROGRESS__]
* Support other HTTP methods than GET (like POST, UPDATE, DELETE) [__IN PROGRESS__]
* Implement an OAuth workflow

## License
MIT
