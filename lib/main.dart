import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lundi/firebase_options.dart';
import 'package:lundi/providers/router/router_provider.dart';
import 'package:lundi/styles/theme.dart';
import 'package:lundi/styles/util.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  final binding = WidgetsFlutterBinding.ensureInitialized();

  // Preload all assets to prevent flash when they are loaded.
  binding.deferFirstFrame();
  binding.addPostFrameCallback((_) async {
    final context = binding.rootElement;
    if (context != null) {
      // Run any sync or awaited async function you want to wait for before showing your UI
      await _precacheAssets(AssetImage("images/background.jpg"));
    }
    binding.allowFirstFrame();
  });

  runApp(
    ProviderScope(
      child: const Lundi(),
    ),
  );
}

Future<void> _precacheAssets(ImageProvider provider) {
  final config = ImageConfiguration(
    bundle: rootBundle,
    devicePixelRatio: 1,
    platform: defaultTargetPlatform,
  );
  final Completer<void> completer = Completer();
  final ImageStream stream = provider.resolve(config);

  late final ImageStreamListener listener;

  listener = ImageStreamListener(
    (ImageInfo image, bool sync) {
      debugPrint("Image ${image.debugLabel} finished loading");
      completer.complete();
      stream.removeListener(listener);
    },
    onError: (dynamic exception, StackTrace? stackTrace) {
      completer.complete();
      stream.removeListener(listener);
      FlutterError.reportError(
        FlutterErrorDetails(
          context: ErrorDescription('image failed to load'),
          library: 'image resource service',
          exception: exception,
          stack: stackTrace,
          silent: true,
        ),
      );
    },
  );

  stream.addListener(listener);
  return completer.future;
}

class Lundi extends ConsumerStatefulWidget {
  const Lundi({super.key});

  @override
  ConsumerState<Lundi> createState() => _LundiState();
}

class _LundiState extends ConsumerState<Lundi> {
  @override
  void didChangeDependencies() {
    precacheImage(
      const AssetImage("images/lundi_logo.png"),
      context,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routeProvider);
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final textTheme = createTextTheme(
      context,
      "Roboto",
      "Roboto",
    );
    final theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Lundi',
      themeMode:
          brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark,
      darkTheme: theme.dark(),
      theme: theme.light(),
      routerConfig: router,
    );
  }
}
