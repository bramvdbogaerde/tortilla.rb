Gem::Specification.new do |gem|
  gem.name    = 'tortilla'
  gem.version = "1.0.0"
  gem.date    = Date.today.to_s

  gem.summary = "Wrapping web APIs made easy."
  gem.description = "Wrapping web APIs made easy. Ruby port of the Tortilla Python project."

  gem.authors  = ['Bram Vandenbogaerde']
  gem.email    = 'contact@bramvdb.com'
  gem.homepage = 'http://github.com/bramvdbogaerde/tortilla.rb'

  gem.add_dependency('httparty',"~> 0.13")
  gem.add_dependency('json',"~> 1.8")
  gem.licenses = ["MIT"]

  gem.files = Dir.glob("lib/*")
end
