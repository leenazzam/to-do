import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:to_do_app/features/login/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthRepo authRepo = AuthRepo();
  void signInWithGoogle() async {
    emit(AuthLoading());

    try {
      final response = await authRepo?.signInWithGoogle();

      debugPrint("response from repo: $response");
      debugPrint(response?.user?.uid);

      emit(AuthSuccess());
    } catch (e) {
      debugPrint("Google Error: $e");
      emit(AuthError(e.toString()));
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.accessToken == null) {
      throw Exception('Facebook login cancelled');
    }

    // Create credential
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Sign in with Firebase
    return await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    );
  }
}
