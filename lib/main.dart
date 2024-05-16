import 'package:counter_app/domain/repositories/conversion_repository.dart';
import 'package:counter_app/presentation/converter/converter_screen.dart';
import 'package:counter_app/presentation/counter/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  print(dotenv.env);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
      routes: <String, WidgetBuilder>{
        '/counter': (BuildContext context) => CounterScreen(),
        '/converter': (BuildContext context) => ConverterScreen(),
      },
    );
  }
}
