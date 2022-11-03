import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/date_symbol_data_local.dart';
import 'app.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

