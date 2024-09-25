import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier() : super(Supabase.instance.client.auth.currentUser) {
    _authSubscripton();
  }

  void _authSubscripton() {
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      state = data.session?.user;
    });
  }

  Future<void> signIn(OAuthProvider provider) async {
    await Supabase.instance.client.auth.signInWithOAuth(
      provider,
      scopes: 'openid email profile',
      redirectTo: _getRedirectUrl(),
    );
  }

  Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
  }

  String _getRedirectUrl() {
    if (kIsWeb) {
      return 'http://localhost:57570/login-callback';
    } else {
      return 'cz.hlavac.ondra.pocfluttersupabaseoauth://login-callback';
    }
  }
}
