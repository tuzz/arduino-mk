Gem::Specification.new do |s|
  s.name        = "arduino-mk"
  s.version     = "1.0.1"
  s.summary     = "arduino-mk"
  s.description = "Compile and upload Arduino sketches with Ruby."
  s.author      = "Chris Patuzzo"
  s.email       = "chris@patuzzo.co.uk"
  s.homepage    = "https://github.com/tuzz/arduino-mk"
  s.files       = ["README.md"] + Dir["lib/**/**"] + Dir["vendor/**/**"]

  s.add_development_dependency "rspec"
end
