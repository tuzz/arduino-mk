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
