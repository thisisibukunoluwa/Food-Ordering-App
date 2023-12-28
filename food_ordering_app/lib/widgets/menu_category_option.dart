import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/models/restaurant_model.dart';

class MenuCategoryOption extends StatelessWidget {
  final  MenuItem menuitem;
  const MenuCategoryOption({super.key, required this.menuitem});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: ClipRRect(
              borderRadius:BorderRadius.circular(16.0), 
              child: CachedNetworkImage(
                  width: 200.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                imageUrl: menuitem.image
            ),
            ),
        ),
         Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                menuitem.title,
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:15.sp
                ),
              ),
              Text(menuitem.description)
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Text('${menuitem.price}')
        )
    ]);
  }
}


