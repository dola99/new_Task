import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_task/provider/access_devices_provider.dart';
import 'package:simple_task/provider/login_provider.dart';
import 'package:simple_task/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(value: LoginProvider()),
      ChangeNotifierProvider.value(value: AccessDevices()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Task',
      home: HomeScreen(),
    );
  }
}
