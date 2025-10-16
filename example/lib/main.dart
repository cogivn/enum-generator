import 'dart:io';
import 'package:enum_annotation/enum_annotation.dart';

part 'main.g.dart';

@generate
enum Shape {
  square(10, 'square'),
  circle(90, 'circle'),
  triangle(1, 'triangle'),
  hexagon(6, 'hexagon');

  final int data;
  final String message;

  const Shape(this.data, this.message);
}

void main() {
  final shape = Shape.circle;

  // all cases must be handled
  final message = shape.when(
    square: () => 'I am a Square',
    circle: () => 'I am a Circle',
    triangle: () => 'I am a Triangle',
    hexagon: () => 'I am a hexagon',
  );

  // Using stdout for better control
  stdout.writeln(message); // I am a Circle

  // all cases may not be handled but `orElse` cannot be null
  final canBeRotated = shape.maybeWhen(
    hexagon: () => true,
    orElse: () => false,
  );
  stdout.writeln('Can be rotate: $canBeRotated'); // false

  // equivalent to print(shape == Shape.circle)
  stdout.writeln('The shape is circle: ${shape.isCircle}'); // true
  stdout.writeln('The shape is Square: ${shape.isSquare}'); // false
  stdout.writeln('The shape is Triangle: ${shape.isTriangle}'); // false
}
