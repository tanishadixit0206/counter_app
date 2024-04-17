import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'bottom_navbar_event.dart';
part 'bottom_navbar_state.dart';

class BottomNavbarBloc extends Bloc<BottomNavbarEvent, BottomNavbarState> { 

  BottomNavbarBloc() : super(BottomNavbarCurrentState(0)) {
    on<BottomNavbarEvent>((event, emit) {
      if (event is TabChange) {
        _onTabChange(event.index);
      }
    });
  }

  void _onTabChange(int index) {
    emit(BottomNavbarCurrentState(index));
    // navigateTo(index);
  }

  void navigateTo(BuildContext context, int index) {
    if (state is BottomNavbarCurrentState) {
      switch (index) {
        case 0:
          Navigator.of(context).pushNamed('/counter');
          break;
        case 1:
          Navigator.of(context).pushNamed('/converter');
          break;
      }
    }
  }
}
