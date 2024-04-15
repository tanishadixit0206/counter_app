import 'package:counter_app/presentation/bottom_navbar/bottom_navbar_screen.dart';
import 'package:counter_app/presentation/converter/bloc/converter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConverterScreen extends StatelessWidget {
  const ConverterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ConverterBloc(),
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
                  decoration: BoxDecoration(color: Colors.purple.shade50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Decimal:"),
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.purple.shade100),
                              child: Text("A"),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Binary:"),
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.purple.shade100),
                              child: Text("A"),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(onPressed: () {}, child: Text("Convert"))
                    ],
                  )),
            ),
            SizedBox(
              child: BottomNavbarScreen(),
              height: 60,
            ),
          ],
        )));
  }
}
