import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterCubitInitial());
  Future<void> Register(
      {required String email, required String password}) async {
    emit(RegisterCubitLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterCubitSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterCubitFailure(
            errorMessage: "The password provided is too weak."));
      } else if (e.code == 'email-already-in-usewrong-password') {
        emit(RegisterCubitFailure(
            errorMessage: "The account already exists for that email."));
      } else {
        emit(RegisterCubitFailure(errorMessage: e.toString()));
      }
    }
  }
}
