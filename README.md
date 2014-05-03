## arduino-mk

Compile and upload arduino sketches with Ruby.

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

To reset your arduino:

```ruby
if arduino.reset
  puts "Arduino reset successfully!"
else
  puts arduino.error
end
```
