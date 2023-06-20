part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginCubitInitial extends LoginState {}

class LoginCubitSuccess extends LoginState {}

class LoginCubitLoading extends LoginState {}

class LoginCubitFailure extends LoginState {
  final String errorMessage;
  LoginCubitFailure({required this.errorMessage});
}
