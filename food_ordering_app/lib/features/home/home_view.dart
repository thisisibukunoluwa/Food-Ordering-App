import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, appBar: CustomAppBar()
        // body:
    );
  }
}



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key});
  @override
  Size get preferredSize => Size.fromHeight(160);
  Widget build(BuildContext context) {
    return  Padding(
     padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 50.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Deliver to",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                          )),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("08776 Serenity Ports, New York",
                              style: TextStyle(color: Colors.black)),
                          Icon(Icons.keyboard_arrow_down_rounded)
                        ],
                      )
                    ]),
                Icon(Icons.person)
                // ICON HERE
              ],
            ),
            //DO CUSTOM APP BAR
              SizedBox(height: 20.h,),
            _SearchBar()
          ],
        ),
    );
  }
}



class _SearchBar extends StatelessWidget {
  const _SearchBar({super.key});

  @override
  Widget build(BuildContext context,) {
    return Flexible(
        child: TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF5F4F8),
                hintText: 'Search for a vendor or product',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0),
                    borderSide: BorderSide.none)),
            // everytime the state is updated it will call the filterCardProvider
            onChanged: (arg){}
          ));
  }
  

}
