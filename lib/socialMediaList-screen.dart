import 'package:flutter/material.dart';
import 'package:tutorial_app/socialMediaModel.dart';

class SocialMediaListScreen extends StatelessWidget {
 SocialMediaListScreen();

 @override
 Widget build(BuildContext context) {
   var socialMedia = Provider.of<SocialMediaModel>(context, listen: false);

   return ListView(
     children: socialMedia.all
         .map((item) => CheckboxSocialMediaItem(item: item))
         .toList(),
   );
 }
}