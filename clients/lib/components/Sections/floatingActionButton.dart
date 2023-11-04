import 'package:flutter/material.dart';
import 'package:get/get.dart';

FloatingActionButton myFloatingButton() => FloatingActionButton(
      onPressed: () => Get.toNamed("/Add"),
      backgroundColor: const Color(0xff40b89c),
      child: const Icon(Icons.add),
    );
