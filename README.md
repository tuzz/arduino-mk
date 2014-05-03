## arduino-mk

Compile and upload Arduino sketches with Ruby.

## Usage

```ruby
arduino = Arduino.new(board: "uno")

if arduino.upload("/path/to/project")
  puts "Sketch uploaded successfully!"
else
  puts arduino.error
end
```

To test if your project compiles without uploading:

```ruby
if arduino.compiles?("/path/to/project")
  puts "Sketch compiles successfully!"
else
  puts arduino.error
end
```

To reset your Arduino:

```ruby
if arduino.reset
  puts "Arduino reset successfully!"
else
  puts arduino.error
end
```

## Further configuration

To include additional Makefile configuration:

```ruby
arduino = Arduino.new(board: "uno", arduino_dir: "/path/to/arduino/libs")
```

The path of the default Makefile is available at:

```ruby
Arduino.makefile
```

You can use this as reference.

## Contribution

If you'd like to contribute, please send me a pull request or open an issue.

It'd be great to test this gem on a wide range of Arduinos and platforms.

You should follow me on [twitter](http://twitter.com/cpatuzzo).

