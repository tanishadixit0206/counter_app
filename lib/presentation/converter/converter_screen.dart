import 'package:counter_app/presentation/converter/bloc/converter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ,
        child: Scaffold(
            body: Column(
          children: [
            AppBar(
              title: Text(
                "Converter Screen",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              backgroundColor: Colors.purple.shade100,
              centerTitle: true,
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(color: Colors.purple.shade50),),
            ),
            
          ],
        )));
  }
}
