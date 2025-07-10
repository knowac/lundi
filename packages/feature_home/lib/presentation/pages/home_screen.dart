import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/config/route_names.dart';
import 'package:shared/generated/l10n.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit:
              MediaQuery.of(context).size.height >
                  MediaQuery.of(context).size.width
              ? BoxFit.fitHeight
              : BoxFit.fitWidth,
          image: AssetImage("packages/shared/lib/images/background.jpg"),
        ),
      ),
      child: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: SmoothBorderRadius(
              cornerRadius: 10,
              cornerSmoothing: 1,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                Text(
                  S.of(context).homeMessageTitle,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontFamily: GoogleFonts.agdasima().fontFamily,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  S.of(context).homeMessageBody,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(RouteNames.plan);
                  },
                  child: Text(
                    S.of(context).homeMessageButton,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimaryFixedVariant,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
