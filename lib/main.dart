import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/preferences_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'store/models/root_store.dart';

import 'constants/route.dart';
import 'constants/keys.dart';

void main() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp(
    sharedPreferences: sharedPreferences,
  ));
}

class MyApp extends StatefulWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({Key? key, required this.sharedPreferences}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<ReactionDisposer> _disposers = List.from([]);

  late final RootStore rootStore;
  late final PreferencesService refService;

  @override
  void initState() {
    super.initState();

    initStores();

    setupReactions();
  }

  @override
  void dispose() {
    super.dispose();

    for (var disposer in _disposers) {
      disposer();
    }
  }

  void initStores() {
    refService = PreferencesService(widget.sharedPreferences);
    rootStore = RootStore(refService);
  }

  void setupReactions() {
    _disposers.add(reaction((_) {
      return rootStore.autoStore.isAuthenticated;
    }, (_) {
      if (rootStore.autoStore.isAuthenticated) {
        AppKeys.navState.pushReplacementNamed(Routes.home);
      } else {
        // empty navigation stack before logging out
        AppKeys.navState.pushNamedAndRemoveUntil(Routes.login, (_) => false);
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PreferencesService>(
          create: (_) => refService,
        ),
        Provider<RootStore>(
          create: (_) => rootStore,
        ),
        // ProxyProvider<PreferencesService, RootStore>(
        //   update: (_, service, __) => RootStore(service),
        // )
      ],
      child: Consumer<RootStore>(builder: ((_, rootStore, __) {
        return Observer(
          builder: ((_) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primaryColor: Colors.black),
              initialRoute: rootStore.autoStore.isAuthenticated
                  ? Routes.home
                  : Routes.login,
              // initialRoute: Routes.home,
              routes: {
                ...authRoutes,
                ...protectedRoutes,
              },
              supportedLocales: [
                ...FormBuilderLocalizations.delegate.supportedLocales
              ],
              navigatorKey: AppKeys.navKey,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                FormBuilderLocalizations.delegate,
              ],
            );
          }),
        );
      })),
    );
  }
}
