import 'package:flutter/material.dart';

extension DateTimeEx on DateTime {
  String get format {
    return '${this.hour}:${this.minute}, ${this.timeZoneName}, ${this.day}/${this.month}/${this.year}';
  }
}
