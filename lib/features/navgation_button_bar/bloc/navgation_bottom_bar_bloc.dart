import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navgation_bottom_bar_event.dart';
part 'navgation_bottom_bar_state.dart';

class NavgationBottomBarBloc
    extends Bloc<NavgationBottomBarEvent, NavgationBottomBarState> {
  NavgationBottomBarBloc() : super(NavgationBottomBarInitial()) {
    on<NavgationBottomBarEvent>((event, emit) {
      if (event is BotNavigate) {
        emit(NavgationBottomBarOnChange(currentpage: event.currentpage));
      }
    });
  }
}
