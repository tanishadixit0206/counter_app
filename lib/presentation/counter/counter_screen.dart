import 'package:counter_app/presentation/bottom_navbar/bottom_navbar_screen.dart';
import 'package:counter_app/presentation/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocConsumer<CounterBloc, CounterState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
                body: Column(
              children: [
                AppBar(
                  title: Text(
                    "Counter Screen",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                context.read<CounterBloc>().add(Increment());
                              },
                              icon: Icon(Icons.add),
                              label: Text(""),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.purple.shade100),
                                child: Center(
                                  child: Text("Count: ${state.count}"),
                                ),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                context.read<CounterBloc>().add(Decrement());
                              },
                              icon: Icon(
                                Icons.remove,
                              ),
                              label: Text(""),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: BottomNavbarScreen(),
                  height: 60,
                ),
              ],
            ));
          }),
    );
  }
}
