part of 'nav_bar_page_bloc.dart';

// ignore: must_be_immutable
sealed class NavBarPageState extends Equatable {
  int page;
  NavBarPageState({required this.page});

  @override
  List<Object> get props => [page];
}

// ignore: must_be_immutable
final class NavBarPageInitial extends NavBarPageState {
  NavBarPageInitial({required super.page});
}
