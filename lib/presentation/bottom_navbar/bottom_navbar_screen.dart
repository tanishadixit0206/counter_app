import "package:counter_app/presentation/bottom_navbar/bloc/bottom_navbar_bloc.dart";
import "package:counter_app/presentation/bottom_navbar/components/bottom_navbar_items.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class BottomNavbarScreen extends StatelessWidget {
  const BottomNavbarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BottomNavbarBloc(),
        child: BlocConsumer<BottomNavbarBloc, BottomNavbarState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                items: BottomNavBarItems,
                currentIndex: state.index,
                selectedItemColor: Theme.of(context).colorScheme.primary,
                unselectedItemColor: Colors.grey,
                onTap: (index) {
                  context.read<BottomNavbarBloc>().add(TabChange(index: index));
                  context.read<BottomNavbarBloc>().navigateTo(context,index);
                },
              ),
            );
          },
        ));
  }
}
