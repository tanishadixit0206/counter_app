import 'package:counter_app/presentation/bottom_navbar/bottom_navbar_screen.dart';
import 'package:counter_app/presentation/converter/bloc/converter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConverterScreen extends StatelessWidget {
  ConverterScreen({Key? key}) : super(key: key);
  TextEditingController decimalcontroller = TextEditingController();
  TextEditingController binarycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConverterBloc(),
      child: BlocConsumer<ConverterBloc, ConverterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
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
                              Expanded(
                                child: TextField(
                                  controller: decimalcontroller,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Decimal",
                                    labelStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 14.0, horizontal: 16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: binarycontroller,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Binary",
                                    labelStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 14.0, horizontal: 16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print(decimalcontroller.text);
                            print(binarycontroller.text);
                            state.decimal = decimalcontroller.text;
                            state.binary = binarycontroller.text;
                            if (state.decimal != "") {
                              context
                                  .read<ConverterBloc>()
                                  .add(DecimalToBinaryEvent());
                            } else if (state.binary != "") {
                              context
                                  .read<ConverterBloc>()
                                  .add(BinaryToDecimalEvent());
                            }
                          },
                          child: Text("Convert"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: BottomNavbarScreen(),
                  height: 60,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
