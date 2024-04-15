part of 'bottom_navbar_bloc.dart';

// @immutable
abstract class BottomNavbarState {
  final int index;
  const BottomNavbarState({required this.index});
}

class BottomNavbarCurrentState extends BottomNavbarState {
  const BottomNavbarCurrentState({required super.index});
}
