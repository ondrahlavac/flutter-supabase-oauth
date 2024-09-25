import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_flutter_supabase_oauth/providers/authentication_provider.dart';
import 'package:poc_flutter_supabase_oauth/screens/login_screen.dart';
import 'package:poc_flutter_supabase_oauth/screens/user_screen.dart';
import 'package:poc_flutter_supabase_oauth/src/themes.dart';

/// The Widget that configures your application.
class FlutterSupabaseOAuthApp extends ConsumerWidget {
  const FlutterSupabaseOAuthApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POC - Flutter Supabase OAuth',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('POC - Flutter Supabase OAuth'),
        ),
        body: Center(
          child: user != null ? const UserScreen() : const LoginScreen(),
        ),
      ),
    );
  }
}
