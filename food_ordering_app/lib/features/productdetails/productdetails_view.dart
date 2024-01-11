import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/core/constants/colors.dart';
import 'package:food_ordering_app/models/restaurant_model.dart';
import 'package:food_ordering_app/widgets/custom_button.dart';
import 'package:food_ordering_app/widgets/custom_icon_button.dart';
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
  final itemCountNotifier = ValueNotifier<int>(1);

  @override
  void dispose() {
    itemCountNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.2.w, bottom: 0),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavBackButton(color: AppColors.black500.withOpacity(0.2)),
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
                  borderRadius: BorderRadius.circular(60.0),
                  child: CachedNetworkImage(
                      width: 314.4.w,
                      height: 300.0.h,
                      fit: BoxFit.cover,
                      imageUrl: widget.menuItem.image),
                ),
              ),
              SizedBox(
                height: 10.h,
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
              SizedBox(height: 50.h),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ValueListenableBuilder(
                          valueListenable: itemCountNotifier,
                          builder: (context, value, _) {
                            return Text(
                                '\$${(widget.menuItem.price * value).toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                    color: AppColors.primary300));
                          }),
                      SizedBox(
                        width: 130.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // if the value is zero change the color and make it untappable
                            // increase space between button and widgets
                            // when you tap the InkWell in executes a fn that adds tha item to the cart with the price
                            // the fn should be a notifier
                            CustomIconButton(
                              color: Colors.white,
                              icon: Icons.remove,
                              borderColor: Colors.black,
                              borderWidth: 1.0,
                              onPressed: () {
                                if (itemCountNotifier.value > 1) {
                                  itemCountNotifier.value--;
                                }
                              },
                            ),
                            ValueListenableBuilder(
                                valueListenable: itemCountNotifier,
                                builder: (context, value, _) {
                                  return Text('$value',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,
                                          color: Colors.black));
                                }),
                            CustomIconButton(
                              color: Colors.white,
                              icon: Icons.add,
                              borderColor: Colors.black,
                              borderWidth: 1.0,
                              onPressed: () {
                                itemCountNotifier.value++;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    widget.menuItem.description,
                    style: TextStyle(
                      height: 1.2,
                      fontSize: 18.sp,
                      color: AppColors.black500,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 70.h,
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
