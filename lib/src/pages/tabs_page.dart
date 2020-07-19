import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provaiderapp/src/pages/tab1_page.dart';
import 'package:provaiderapp/src/pages/tab_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel() ,
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacion = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacion.paginaActual,
      onTap: (i) => navegacion.paginaActual = i,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline), title: Text('para ti'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public), title: Text('Encabezado'),
        )
      ],

    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegaacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegaacionModel.pageController ,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
       Tab1Page(),
       Tab2Page()
      ],
    );
  }
}


class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();


  PageController get pageController => _pageController;

  int get paginaActual => _paginaActual;

  set paginaActual(int value) {
    _paginaActual = value;
    _pageController.animateToPage(_paginaActual, duration: Duration(milliseconds: 250), curve: Curves.easeOutCubic);
    notifyListeners();
  }
}