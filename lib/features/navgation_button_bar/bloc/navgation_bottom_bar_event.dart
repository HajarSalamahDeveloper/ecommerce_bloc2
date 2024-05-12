part of 'navgation_bottom_bar_bloc.dart';

@immutable
sealed class NavgationBottomBarEvent {}

class BotNavigate extends NavgationBottomBarEvent {
  final int currentpage;
  BotNavigate(this.currentpage);
}
