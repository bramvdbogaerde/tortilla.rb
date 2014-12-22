############ License: MIT #############
####### Continious rspec tester #######
##### Only for use with Mac OS X ######
#######################################

require 'bundler'
Bundler.require

listener = Listen.to("./") do |modified, added, removed|
  if(removed.empty?)
    puts `cd tests && rspec tortilla_rspec.rb --format=doc --format=Nc`
  end
end
listener.start # not blocking
sleep
