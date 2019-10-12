import 'package:flutter/material.dart';
import 'package:componentes/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:componentes/pages/home_page.dart';
import 'package:componentes/pages/alert_page.dart';
//mport 'package:componentes/pages/avatar_page.dart';
//import 'package:componentes/pages/home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [//Picker
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,

      ],
      supportedLocales: [//Picker
        const Locale('en','US'), // English
        const Locale('es','ES'), // Spanish
        const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
      //home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( settings ){ //Es como 404
        print('Ruta llamada baby ${settings.name}');
        return MaterialPageRoute(
          builder: (context) => AlertPage(),
        );
      },
    );
  }
}

