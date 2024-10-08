import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isOnline = true.obs;
  var courses = [
    {
      'name': 'Class 10th - Mathematics',
      'teacher': 'Mr. Sampath',
      'language': 'Hinglish',
      'isLive': true,
      'imageUrl': 'assets/imageone.png',
    },
    {
      'name': 'ARAMBH - NEET DROPPER BATCH',
      'teacher': 'Mr. Sampath',
      'language': 'Hinglish',
      'isLive': true,
      'imageUrl': 'assets/imageone.png',
    },
  ].obs;

  final RxList<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: Colors.deepPurple,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.school,
        color: Colors.deepPurple,
      ),
      label: 'Batch',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.chat,
        color: Colors.deepPurple,
      ),
      label: 'Chat',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
        color: Colors.deepPurple,
      ),
      label: 'Profile',
    ),
  ].obs;
}
