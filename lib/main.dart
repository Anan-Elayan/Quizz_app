import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quizzler_app/generated/l10n.dart';
import 'package:quizzler_app/quiz_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void _setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: _locale,
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black12.withOpacity(0.1),
            title: Text(
              S.of(context).appName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            actions: [
              Switch(
                value: _locale.languageCode == 'ar',
                onChanged: (value) {
                  _setLocale(value ? const Locale('ar') : const Locale('en'));
                },
              ),
            ],
            centerTitle: true,
          ),
          backgroundColor: Colors.grey.shade900,
          body: const SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          ),
        );
      }),
    );
  }
}
