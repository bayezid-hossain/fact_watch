
import 'package:flutter/cupertino.dart';

class FavoriteList with ChangeNotifier{

  List<int> _favoriteNews=[];
  List<int> get favoriteNews=>_favoriteNews;
  void add(int i){
    _favoriteNews.add(i);
  }
  void remove(int i){
    _favoriteNews.remove(i);
    notifyListeners();
  }
}
