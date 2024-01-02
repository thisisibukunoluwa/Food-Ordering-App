import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/models/restaurant_model.dart';
import 'package:food_ordering_app/widgets/custom_button.dart';
import 'package:food_ordering_app/widgets/navback_button.dart';

class ProductDetailsView extends StatefulWidget {
  final MenuItem menuItem;
  const ProductDetailsView({super.key, required this.menuItem});

  static const routeName = '/product-details';

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool isSelected = false;
  int? _value = 1;
  List<String> sizes = ['X-Large', 'Large', 'Small'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.2.w, bottom: 0),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const NavBackButton(color: Colors.white),
              Text(widget.menuItem.title,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp)),
              Text('\$${widget.menuItem.price}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: const Color(0xFFCF8600))),
            ],
          ),
          Column(
            children: [
              Hero(
                tag: '${widget.menuItem.title}-detail-image',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: CachedNetworkImage(
                      width: 314.4.w,
                      height: 300.0.h,
                      fit: BoxFit.cover,
                      imageUrl: widget.menuItem.image),
                ),
              ),
              Wrap(
                spacing: 5.0,
                children: List<Widget>.generate(
                  3,
                  (int index) {
                    return ChoiceChip(
                      backgroundColor: Colors.white,
                      selectedColor:
                          _value == index ? Colors.black : Colors.white,
                      label: Text(
                        sizes[index],
                      ),
                      labelStyle: TextStyle(
                        color: _value == index ? Colors.white : Colors.black,
                      ),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(13))),
                      side: const BorderSide(color: Colors.black),
                      selected: _value == index,
                      onSelected: (bool selected) {
                        setState(() {
                          _value = selected ? index : null;
                        });
                      },
                    );
                  },
                ).toList(),
              ),
              Row(
                children: [
                  Text('\$${widget.menuItem.price}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: const Color(0xFFCF8600))),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                            ),
                            child: IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {})),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                            ),
                            child: IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {})),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          CustomButton(
              onPressed: () {
                print('');
              },
              buttonText: 'Add to bag',
              color: Colors.black)
        ],
      ),
    ));
  }
}


//title

//image

//sizes

//price

//description

//nothing to select

//add to bag
