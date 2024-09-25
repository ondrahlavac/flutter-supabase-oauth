import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  if (!dotenv.env.containsKey('SUPABASE_URL') ||
      !dotenv.env.containsKey('SUPABASE_ANON_KEY')) {
    throw Exception(
        'Missing environment variables for Supabase connection in .env file');
  }

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(
    const ProviderScope(
      child: FlutterSupabaseOAuthApp(),
    ),
  );
}
