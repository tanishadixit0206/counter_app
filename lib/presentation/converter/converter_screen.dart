import 'package:counter_app/data/services/remote/api_service.dart';
import 'package:counter_app/domain/repositories/conversion_repository.dart';
import 'package:counter_app/presentation/bottom_navbar/bottom_navbar_screen.dart';
import 'package:counter_app/presentation/converter/bloc/converter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConverterScreen extends StatelessWidget {
  ConverterScreen({Key? key}) : super(key: key);
  TextEditingController inputcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();
    ConversionRepository conversionRepository =
        ConversionRepository(apiService);
    return BlocProvider(
      create: (context) => ConverterBloc(conversionRepository),
      child: BlocConsumer<ConverterBloc, ConverterState>(
        listener: (context, state) {},
        builder: (context, state) {
          String text1;
          String text2;
          String output;
          if (state is BinaryToDecimalState) {
            text1 = BinaryToDecimalState.text1;
            text2 = BinaryToDecimalState.text2;
            output = state.decimal;
          } else if (state is DecimalToBinaryState) {
            text1 = DecimalToBinaryState.text1;
            text2 = DecimalToBinaryState.text2;
            output = state.binary;
          } else {
            text1 = "";
            text2 = "";
            output = "";
          }
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text("From"),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Text(text1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("To"),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Text(text2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                                  controller: inputcontroller,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Input Number",
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
                          child: Row(children: [
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(output),
                                  ),
                                ],
                              ),
                            ))
                          ]),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<ConverterBloc>()
                                      .add(ConvertEvent(inputcontroller.text));
                                },
                                child: Text("Convert"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<ConverterBloc>()
                                      .add(ResetConversionEvent());
                                },
                                child: Text("Reset"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<ConverterBloc>()
                                      .add(SwapConversionEvent());
                                },
                                child: Text("Swap"),
                              ),
                            ),
                          ],
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
