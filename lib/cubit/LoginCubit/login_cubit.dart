import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginCubitInitial());
  Future<void> Login({required String email, required String password}) async {
    emit(LoginCubitLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginCubitSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginCubitFailure(errorMessage: "No user found for that email."));
      } else if (e.code == 'wrong-password') {
        emit(LoginCubitFailure(
            errorMessage: "Wrong password provided for that user."));
      } else {
        emit(LoginCubitFailure(errorMessage: e.toString()));
      }
    }
  }
}
