import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_flutter_supabase_oauth/providers/authentication_provider.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);
    final fullName = user?.userMetadata?['full_name'];
    final email = user?.userMetadata?['email'];
    final avatar = user?.userMetadata?['avatar_url'];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserAvatar(
            avatarUrl: avatar,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            fullName,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            email,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          Text('Signed in via ${user?.appMetadata['provider']}'),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(authProvider.notifier).signOut();
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    this.avatarUrl,
  });

  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    if (avatarUrl != null) {
      return CircleAvatar(
        radius: 60,
        backgroundImage: NetworkImage(avatarUrl!),
      );
    } else {
      return const Icon(Icons.person);
    }
  }
}
