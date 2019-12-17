import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/details/presentation/page.dart';
import 'package:github_client_flutter/details/provider.dart';
import 'package:github_client_flutter/main/presentation/page.dart';
import 'package:github_client_flutter/main/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AbstractRoutes routes =
      PageRoutes(pages: <String, Page<Object, dynamic>>{
    'main': MainPage(
        MainProvider.provideMainEffectBuilder(),
        MainProvider.provideMainViewBuilder(),
        MainProvider.provideMainReducerBuilder(),
        MainProvider.providePagingComponent()),
    'details': DetailsPage(
        DetailsProvider.provideMainViewBuilder(),
        DetailsProvider.provideMainReducerBuilder(),
        DetailsProvider.provideMainEffectBuilder()),
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: routes.buildPage('main', null),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(builder: (BuildContext context) {
          return routes.buildPage(settings.name, settings.arguments);
        });
      },
    );
  }
}
