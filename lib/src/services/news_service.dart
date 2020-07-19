import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provaiderapp/src/models/category_model.dart';
import 'package:provaiderapp/src/models/new_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _API_KEY = '66865773368747d4b64ba6a7859900b9';
class NewsService with ChangeNotifier{

  List<Article> headLines = [];

  String _selecCategory = 'business';

  String get selecCategory => _selecCategory;

  set selecCategory(String value) {
    _selecCategory = value;
    this.getArtilesByCategory(_selecCategory);
    notifyListeners();
  }

  List<Category> catagories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),

  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService(){
    this.getTopHeadlines();
    catagories.forEach((item) {

      this.categoryArticles[item.name] = new List();
    });
  }


  getTopHeadlines() async{

    final url = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=co';

    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);

    this.headLines.addAll(newsResponse.articles);

    notifyListeners();

  }

  getArtilesByCategory( String category) async {

    if(this.categoryArticles[category].length > 0){
      return this.categoryArticles[category];

    }

    final url = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=co&category=$category';

    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);

    this.categoryArticles[category].addAll(newsResponse.articles);
  }
}