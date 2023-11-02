import 'package:clients/view/AddTaskPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

FloatingActionButton MyFloatingButton() => FloatingActionButton(
      onPressed: () => Get.to(() => AddingTask()),
      backgroundColor: const Color(0xff40b89c),
      child: const Icon(Icons.add),
    );
