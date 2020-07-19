import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provaiderapp/src/services/news_service.dart';
import 'package:provaiderapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    final newService = Provider.of<NewsService>(context);

    return Scaffold(
      body: (newService.headLines.length == 0) ? Center(
        child: CircularProgressIndicator(),
      ) : ListaNoticias(newService.headLines)
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
