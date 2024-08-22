part of "nav_bloc.dart";

sealed class NavEvent {}

class NavUpdated extends NavEvent {
  int index;

  NavUpdated({required this.index});
}
