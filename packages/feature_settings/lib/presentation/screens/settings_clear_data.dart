import 'package:feature_settings/presentation/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/generated/l10n.dart';

class SettingsClearData extends ConsumerStatefulWidget {
  const SettingsClearData({super.key});

  @override
  ConsumerState createState() => _SettingsClearDataState();
}

class _SettingsClearDataState extends ConsumerState<SettingsClearData> {
  @override
  Widget build(BuildContext context) => Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(
        16,
      ),
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            textAlign: TextAlign.center,
            S.of(context).settingsClearDataExplanation,
            style: GoogleFonts.roboto().copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 24,
            ),
          ),
          FilledButton(
            onPressed: () => ref.read(settingsProvider.notifier).clearData(),
            child: ref
                .watch(settingsProvider)
                .when(
                  data: (data) => Text(S.of(context).settingsClearData),
                  error: (error, stackTrace) => Text('Error. Retry.'),
                  loading: () => const CircularProgressIndicator(),
                ),
          ),
        ],
      ),
    ),
  );
}
