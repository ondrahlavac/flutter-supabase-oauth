import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_flutter_supabase_oauth/providers/authentication_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Choose your preferred OAuth provider',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            ref.watch(authProvider.notifier).signIn(OAuthProvider.azure);
          },
          child: const Text('Login with Microsoft'),
        ),
        ElevatedButton(
          onPressed: () {
            ref.watch(authProvider.notifier).signIn(OAuthProvider.google);
          },
          child: const Text('Login with Google'),
        ),
      ],
    );
  }
}
