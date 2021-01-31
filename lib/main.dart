import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hello_word_android_studio/db/profile_repository.dart';
import 'package:hello_word_android_studio/db/sql.dart';
import 'package:hello_word_android_studio/navigation/router_delegate.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localization.dart';
import 'navigation/route_information_page.dart';
import 'screens/home_screen.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  //final cameras = await availableCameras();

  //final camera = cameras.length > 0 ? cameras.first : null;

  final sql = Sql();
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => ProfileRepository(sql: sql),
        ),

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  PathRouterDelegate _routerDelegate;
  ProfileRouteInformationParser _routeInformationParser;
@override
  void initState() {
  _routeInformationParser = ProfileRouteInformationParser();
  _routerDelegate = PathRouterDelegate();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AbelBnB',
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      routeInformationParser: ProfileRouteInformationParser(),
      routerDelegate: PathRouterDelegate(),
      // A nyelvi osztályokat regisztráló delegate objektumok listája
      // Ezeken keresztül tölti be a rendszer szükség esetén az éppen aktuális
      // nyelv alapján a megfelelő localization osztályokat, amiken keresztül
      // elérhetjük a lefordított szövegeket.
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // Az alkalmazásunk által támogatott nyelvek listája
      supportedLocales: [
        const Locale('en', ''),
        const Locale('hu', ''),
      ],
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
