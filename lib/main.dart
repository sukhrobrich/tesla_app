import 'package:flutter/cupertino.dart';
import 'package:tesla_app/app.dart';

import 'config/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  service();
  runApp(const MyApp());
}
