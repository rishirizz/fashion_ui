import 'package:fashion_ui/models/model.dart';
import 'package:fashion_ui/screens/details_page.dart';
import 'package:fashion_ui/screens/home_page.dart';
import 'package:fashion_ui/screens/model_description_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // useMaterial3: true,
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      onGenerateRoute: (RouteSettings settings) {
        debugPrint('build route for ${settings.name}');
        var routes = <String, WidgetBuilder>{
          HomePage.routeName: (BuildContext context) => const HomePage(),
          ShowDetailsPage.routeName: (BuildContext context) => ShowDetailsPage(
                show: settings.arguments as Show?,
              ),
          ModelDescriptionPage.routeName: (BuildContext context) =>
              ModelDescriptionPage(
                modelImage: settings.arguments.toString(),
              ),
        };
        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(
          builder: (ctx) => builder(ctx),
        );
      },
    );
  }
}
