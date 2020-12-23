import 'package:flutter/material.dart';
import 'package:tutorial_app/socialMedia.dart';
import 'package:tutorial_app/socialMediaModel.dart';

class CheckboxSocialMediaItem extends StatelessWidget {
 final SocialMedia item;

 CheckboxSocialMediaItem({Key key, @required this.item}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(Dimens.paddingDefault),
     child: Row(
       children: [
         Consumer<SocialMediaModel>(
           builder: (context, model, child) {
             return Checkbox(
               value: item.isFavourite,
               onChanged: (isChecked) =>
                   model.setFavourite(item.id, isChecked),
             );
           },
         ),
         SocialMediaItem(
           item: item,
         )
       ],
     ),
   );
 }
}