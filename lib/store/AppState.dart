import 'package:meta/meta.dart';

@immutable
class AppState {
  final String email;
  final int test;

  AppState({@required this.email, @required this.test});
}
