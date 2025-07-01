import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lundi/config/route_names.dart';
import 'package:lundi/generated/l10n.dart';
import 'package:lundi/providers/auth_repository_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
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
    print("Settings");
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
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: Theme.of(context).colorScheme.outlineVariant,
          );
        },
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () async {
              switch (index) {
                case 0:
                  if (isAuthenticated) {
                    await ref.read(authRepositoryProvider).signout();
                    return;
                  }
                  GoRouter.of(context).pushNamed(RouteNames.settingsSignUp);
                  break;
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
          );
        },
        itemCount: _options.length,
      ),
    );
  }
}
