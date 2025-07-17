import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/config/route_names.dart';
import 'package:shared/di/feature_auth/auth_repository.dart';
import 'package:shared/generated/l10n.dart';
import 'package:shared/providers/auth_state.dart';

/// Settings screen
class SettingsScreen extends ConsumerStatefulWidget {
  /// Settings screen constructor
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  late List<String> _options;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('Settings');
    final authState = ref.watch(authStateStreamProvider);
    final isAuthenticated = authState.valueOrNull != null;
    _options = [
      isAuthenticated
          ? S.of(context).settingsSignOut
          : S.of(context).settingsSignUp,
      S.of(context).settingsExport,
      S.of(context).settingsLicense,
      S.of(context).settingsPrivacyPolicy,
      S.of(context).settingsClearData,
    ];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        itemBuilder: (context, index) => ListTile(
          onTap: () async {
            switch (index) {
              case 0:
                if (isAuthenticated) {
                  await ref.read(sharedAuthRepositoryProvider).signout();
                  return;
                }
                unawaited(
                  GoRouter.of(context).pushNamed(RouteNames.settingsSignUp),
                );
                return;
              case 4:
                unawaited(
                  GoRouter.of(context).pushNamed(RouteNames.settingsClearData),
                );
                return;
              default:
            }
          },
          title: Text(
            _options[index],
            style: GoogleFonts.roboto().copyWith(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        itemCount: _options.length,
      ),
    );
  }
}
