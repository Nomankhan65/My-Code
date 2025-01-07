import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  RxInt currentIndex=0.obs;
   RxList screenList = [
    Icon(Icons.ac_unit),
    Icon(Icons.abc_rounded),
    Icon(Icons.access_alarm),
    Icon(Icons.access_time_filled_outlined)
  ].obs;

  onChange(int index){
  currentIndex.value=index;
  }
}