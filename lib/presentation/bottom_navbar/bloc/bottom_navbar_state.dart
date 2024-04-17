part of 'bottom_navbar_bloc.dart';

// @immutable
abstract class BottomNavbarState {
  int index;
  BottomNavbarState(this.index);
}

class BottomNavbarCurrentState extends BottomNavbarState {
  BottomNavbarCurrentState(super.index);
}
