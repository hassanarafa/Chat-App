part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterCubitInitial extends RegisterState {}

class RegisterCubitSuccess extends RegisterState {}

class RegisterCubitLoading extends RegisterState {}

class RegisterCubitFailure extends RegisterState {
  final String errorMessage;
  RegisterCubitFailure({required this.errorMessage});
}
