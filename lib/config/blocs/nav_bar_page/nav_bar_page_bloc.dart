import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_bar_page_event.dart';
part 'nav_bar_page_state.dart';

class NavBarPageBloc extends Bloc<NavBarPageEvent, NavBarPageState> {
  NavBarPageBloc() : super(NavBarPageInitial(page: 0)) {
    on<NavBarPageChange>((event, emit) {
      emit(NavBarPageInitial(page: event.tabIndex));
    });
  }
}
