part of 'bottom_navbar_bloc.dart';

abstract class BottomNavbarEvent {}

class TabChange extends BottomNavbarEvent {
  final int index;
  TabChange({required this.index});
}
