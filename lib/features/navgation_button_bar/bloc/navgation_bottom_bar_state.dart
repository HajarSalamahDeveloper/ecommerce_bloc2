part of 'navgation_bottom_bar_bloc.dart';

@immutable
sealed class NavgationBottomBarState {
  final int currentpage;

  const NavgationBottomBarState({required this.currentpage});
}

final class NavgationBottomBarInitial extends NavgationBottomBarState {
  const NavgationBottomBarInitial() : super(currentpage: 0);
}

final class NavgationBottomBarOnChange extends NavgationBottomBarState {
  NavgationBottomBarOnChange({required super.currentpage});
}
