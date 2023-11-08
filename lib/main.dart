import 'package:bloc_demo/app/app.dart';
import 'package:flutter/material.dart';

import 'di/dependency_registry.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}
