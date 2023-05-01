import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';

@freezed
class Tag with _$Tag {
  const factory Tag({
    required String name,
    int? id,
    @Default(TagColor.noColor) TagColor color,
  }) = _Tag;
}

enum TagColor {
  // add shades of these colors aswell
  noColor,
  red,
  redAccent,
  orange,
  orangeAccent,
  yellow,
  yellowAccent,
  green,
  greenAccent,
  blue,
  blueAccent,
  purple,
  purpleAccent,
  pink,
  pinkAccent,
  brown,
  blueGray,
  grey;

  Color? toColor() {
    switch (this) {
      case TagColor.noColor:
        return null;
      case TagColor.red:
        return Colors.red;
      case TagColor.redAccent:
        return Colors.redAccent;
      case TagColor.orange:
        return Colors.orange;
      case TagColor.orangeAccent:
        return Colors.orangeAccent;
      case TagColor.yellow:
        return Colors.yellow;

      case TagColor.green:
        return Colors.green;
      case TagColor.blue:
        return Colors.blue;
      case TagColor.purple:
        return Colors.purple;
      case TagColor.pink:
        return Colors.pink;
      case TagColor.brown:
        return Colors.brown;
      case TagColor.grey:
        return Colors.grey;
      case TagColor.yellowAccent:
        return Colors.yellowAccent;
      case TagColor.greenAccent:
        return Colors.greenAccent;
      case TagColor.blueAccent:
        return Colors.blueAccent;
      case TagColor.purpleAccent:
        return Colors.purpleAccent;
      case TagColor.pinkAccent:
        return Colors.pinkAccent;
      case TagColor.blueGray:
        return Colors.blueGrey;
    }
  }
}
