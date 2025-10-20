import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/repository/repository.dart';
import 'package:flutter_project/storage/storage.dart';
import 'package:flutter_project/presentation/app.dart';

Repository repository = Repository(dio: Dio());
Storage storage = Storage();

void main() {
  runApp(const MyApp());
}

