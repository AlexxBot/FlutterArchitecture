import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tutorial_app/socialMedia.dart';

class SocialMediaModel extends ChangeNotifier {
 final List<SocialMedia> _socialMedia = [ /* some social media objects */ ];

 UnmodifiableListView<SocialMedia> get favourites => UnmodifiableListView(_socialMedia.where((item) => item.isFavourite));

 UnmodifiableListView<SocialMedia> get all => UnmodifiableListView(_socialMedia);
 


  void setFavourite(int itemId, bool isChecked) {
  _socialMedia
      .firstWhere((item) => item.id == itemId)
      .setFavourite(isChecked);
  notifyListeners();
  }
}