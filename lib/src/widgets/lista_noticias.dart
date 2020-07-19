

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provaiderapp/src/models/new_models.dart';
import 'package:provaiderapp/src/theme/thema.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;
  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (context, index) {
        return _Noticia(notica: this.noticias[index] , index: index);
      },
    );
  }
}


class _Noticia extends StatelessWidget {
  final Article notica;
  final int index;

  const _Noticia({
    @required this.notica,
    @required this.index}) ;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetaTopBar(notica: this.notica, index: this.index,),
        _TartaTitulo(notica: notica,),
        _TarjetaImagen(notica: notica,),
        _TarjetaBody(notica: notica,),
        _TarjetaBotones(),
        SizedBox(height: 10,),
        Divider(),
      ],
    );
  }
}
class _TarjetaTopBar extends StatelessWidget {
  final Article notica;
  final int index;

  const _TarjetaTopBar({
    @required this.notica, @required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10) ,
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${index + 1}. ', style: TextStyle(color: miTema.accentColor),),
          Text('${notica.source.name}'),
        ],
      ),

    );
  }

}
class  _TartaTitulo extends StatelessWidget {
  final Article notica;

  const _TartaTitulo({this.notica});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(notica.title, style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w700),),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {

  final Article notica;

  const _TarjetaImagen({this.notica});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50) , bottomRight: Radius.circular(50)),
        child: Container(
          child: (notica.urlToImage != null) ?  FadeInImage(
            image:NetworkImage(notica.urlToImage)   ,
            placeholder: AssetImage('assets/img/giphy.gif') ,
          )  : Image (image:AssetImage('assets/img/no-image.png' )),
        ),
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article notica;

  const _TarjetaBody({this.notica});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(notica.description != null ? notica.description : '') ,
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            fillColor: miTema.accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border),
          ),
          SizedBox(width: 10,),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more),
          )
        ],
      ),
    );
  }
}



