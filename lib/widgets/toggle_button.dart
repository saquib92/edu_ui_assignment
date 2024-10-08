import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/toggle_controller.dart';

class ToggleButton extends StatelessWidget {
  ToggleButton({super.key});

  final ToggleController toggleController = Get.find<ToggleController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildToggleButton('Online', toggleController.isOnline.value),
              _buildToggleButton('Offline', !toggleController.isOnline.value),
            ],
          ),
        );
      },
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        toggleController.toggleStatus(text == 'Online');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
