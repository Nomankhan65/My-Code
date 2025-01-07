import 'package:code/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:Obx((){
          return controller.screenList[controller.currentIndex.value];
        }),// Display the screen based on the selected index
        bottomNavigationBar: Obx(() {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade200, // Grey color
                      Colors.white, // White color
                    ],
                    stops: [
                      0.05, // 10% grey
                      0.2, // 90% white
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: BottomNavigationBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  unselectedItemColor: Colors.grey,
                  selectedFontSize:12,
                  showSelectedLabels:false,
                  currentIndex:controller.currentIndex.value, // Active tab index
                  selectedItemColor: Colors.blue, // Change to match your design
                  selectedLabelStyle: const TextStyle(fontFamily: 'Mulish'),
                  unselectedLabelStyle: const TextStyle(fontFamily: 'Mulish'),
                  showUnselectedLabels: false,
                  type:
                      BottomNavigationBarType.fixed, // Ensure consistent layout
                  onTap: (index) {
                    controller.onChange(index); // Handle tab change
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label:'',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.chat_bubble_outline),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.notifications),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: '',
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -25,
                left: MediaQuery.of(context).size.width / 2 -
                    30, // Center the "+" button
                child: GestureDetector(
                  onTap: () {
                    // Define the action for "+" button
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 65,
                        height: 51,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200, // Shadow color
                                offset: Offset(0,4), // Offset only in the vertical direction (downwards)
                                blurRadius:2, // Blur effect for a soft shadow
                                spreadRadius:0, // Ensures the shadow doesn't grow beyond its offset
                              ),
                            ],
                            border: Border.all(color: Colors.white, width:5)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //),
            ],
          );
        }),
      ),
    );
  }
}
