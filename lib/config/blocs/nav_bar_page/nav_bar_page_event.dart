part of 'nav_bar_page_bloc.dart';

sealed class NavBarPageEvent extends Equatable {
  const NavBarPageEvent();

  @override
  List<Object> get props => [];
}

final class NavBarPageChange extends NavBarPageEvent {
  final int tabIndex;
  const NavBarPageChange({required this.tabIndex});
}
