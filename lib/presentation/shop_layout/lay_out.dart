import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/shop_cubit.dart';
import '../../business_logic/cubit/shop_states.dart';


class ShopLayOut extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context);
    return  BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(

            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
               backgroundColor: Colors.grey[200],
              elevation: 10.0,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.deepPurpleAccent[700],
              iconSize: 27,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeNav(index);
              },
              items:  const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                   label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.money_dollar_circle
                  ),
                   label: 'كاش باك',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.check_mark_circled),
                   label: 'طلباتي',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.tour_outlined),
                  label: 'معالم',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_crop_circle),
                  label: 'حسابي',
                ),

              ],
            ),
          ),
        );
      },

    );
  }
}
