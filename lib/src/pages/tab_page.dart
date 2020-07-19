import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provaiderapp/src/models/category_model.dart';
import 'package:provaiderapp/src/services/news_service.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(child: _ListaCategoria())
          ],
        ),
      ),
    );
  }
}

class _ListaCategoria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final categoriesp = Provider.of<NewsService>(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: categoriesp.catagories.length,
      itemBuilder:  (context, index) {
        return Container(
//          width: 105,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                _CategoryButton(category:  categoriesp.catagories[index]),
                SizedBox(height: 5,),
                Text(categoriesp.catagories[index].name , style: TextStyle(),)
              ],
            ) ,
          ),
        );


      },
    );
  }
}

class _CategoryButton extends StatelessWidget {

  final Category category;




  const _CategoryButton({Key key, this.category}) ;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
//        print(category.name);
      final nerService = Provider.of<NewsService>(context , listen: false);


      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.iconData,
          color: Colors.black54,
        ),
      ),
    );

    //return Icon(category.iconData);
  }
}
