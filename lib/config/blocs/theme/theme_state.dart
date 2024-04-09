part of 'theme_bloc.dart';

// ignore: must_be_immutable
class ThemeState extends Equatable {
  bool theme;
  ThemeState(this.theme);

  @override
  List<Object> get props => [theme];
}

// ignore: must_be_immutable
final class ThemeInitial extends ThemeState {
  ThemeInitial(super.theme);
}

// ignore: must_be_immutable
final class ThemeUpdate extends ThemeState {
  @override
  // ignore: overridden_fields
  bool theme;
  ThemeUpdate({required this.theme}) : super(theme);
}
