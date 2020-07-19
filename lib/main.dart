import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provaiderapp/src/pages/tabs_page.dart';
import 'package:provaiderapp/src/services/news_service.dart';
import 'package:provaiderapp/src/theme/thema.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyaApp());
class MyaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new NewsService()),
      ],
      child: MaterialApp(
        title: 'Material app',
        debugShowCheckedModeBanner: false,
        theme: miTema,
        home: TabsPage() ,
      ),
    );
  }
}
